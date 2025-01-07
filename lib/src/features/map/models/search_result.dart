class SearchResult {
  const SearchResult({
    required this.cancel,
    this.manualMarker = false,
  });

  final bool cancel;
  final bool manualMarker;
}
