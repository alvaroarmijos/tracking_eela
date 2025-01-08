part of 'search_cubit.dart';

class SearchState {
  const SearchState({
    this.showManualMarker = false,
    this.route,
  });

  final bool showManualMarker;
  final Route? route;

  SearchState copyWith({
    final bool? showManualMarker,
    final Route? route,
  }) {
    return SearchState(
      showManualMarker: showManualMarker ?? this.showManualMarker,
      route: route ?? this.route,
    );
  }
}
