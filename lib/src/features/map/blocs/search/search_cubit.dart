import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/data/routes/domain/place.dart';
import 'package:tracking_eela/src/data/routes/domain/route.dart';
import 'package:tracking_eela/src/data/routes/infrastructure/routes_repository_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  final _repository = RoutesRepositoryImpl();

  void updateShowManualMarker(bool value) {
    emit(state.copyWith(showManualMarker: value));
  }

  void getRoute(LatLng start, LatLng end) async {
    emit(state.copyWith(isLoading: true));

    final route = await _repository.getRouteStartToEnd(start, end);

    if (route == null) {
      // Mostrar algun mensaje de error
    } else {
      emit(
        state.copyWith(
          route: route,
          showManualMarker: false,
          isLoading: false,
        ),
      );
    }
  }

  void searchPlaces(String query, LatLng proximity) async {
    final places = await _repository.searchPlace(query, proximity);

    emit(state.copyWith(places: places));
  }
}
