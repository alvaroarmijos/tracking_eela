import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/core/widgets/start_uber_marker.dart';

Future<BitmapDescriptor> getStartUberMarker(String time, String place) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startUberMarker = StartUberMarker(time: time, place: place);
  startUberMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteData = await image.toByteData(
    format: ImageByteFormat.png,
  );

  // Resize image

  final imageCodec = await instantiateImageCodec(
    byteData!.buffer.asUint8List(),
    targetHeight: 60,
  );
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(
    format: ImageByteFormat.png,
  );
  return BitmapDescriptor.bytes(data!.buffer.asUint8List());
}
