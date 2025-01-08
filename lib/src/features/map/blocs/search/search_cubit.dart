import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/data/routes/domain/route.dart';
import 'package:tracking_eela/src/data/routes/infrastructure/routes_repository_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void updateShowManualMarker(bool value) {
    emit(state.copyWith(showManualMarker: value));
  }

  void getRoute(LatLng start, LatLng end) async {
    final repository = RoutesRepositoryImpl();

    final route = await repository.getRouteStartToEnd(start, end);

    emit(state.copyWith(route: route, showManualMarker: false));
  }
}
