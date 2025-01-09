import 'package:tracking_eela/src/data/routes/domain/place.dart';

class SearchResult {
  const SearchResult({
    required this.cancel,
    this.manualMarker = false,
    this.place,
  });

  final bool cancel;
  final bool manualMarker;
  final Place? place;
}
