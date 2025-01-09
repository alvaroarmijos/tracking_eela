part of 'search_cubit.dart';

class SearchState {
  const SearchState({
    this.showManualMarker = false,
    this.route,
    this.isLoading = false,
    this.places = const [],
  });

  final bool showManualMarker;
  final Route? route;
  final bool isLoading;
  final List<Place> places;

  SearchState copyWith({
    final bool? showManualMarker,
    final Route? route,
    final bool? isLoading,
    final List<Place>? places,
  }) {
    return SearchState(
      showManualMarker: showManualMarker ?? this.showManualMarker,
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
      places: places ?? this.places,
    );
  }
}
