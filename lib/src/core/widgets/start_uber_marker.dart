import 'package:flutter/material.dart';

class StartUberMarker extends CustomPainter {
  final String time;
  final String place;

  StartUberMarker({
    super.repaint,
    required this.time,
    required this.place,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = Colors.purple;

    final whitePaint = Paint()..color = Colors.white;

    const radiusPurple = 20.0;
    const radiusWhite = 8.0;

    canvas.drawCircle(
      Offset(radiusPurple, size.height - radiusPurple),
      radiusPurple,
      purplePaint,
    );

    canvas.drawCircle(
      Offset(radiusPurple, size.height - radiusPurple),
      radiusWhite,
      whitePaint,
    );

    // Caja de información
    final path = Path();

    path.moveTo(radiusPurple * 2, 20);

    path.lineTo(size.width - 10, 20);

    path.lineTo(size.width - 10, size.height - radiusPurple * 2);

    path.lineTo(radiusPurple * 2, size.height - radiusPurple * 2);

    // path.lineTo(radiusPurple * 2, 20);

    canvas.drawPath(path, whitePaint);

    // caja morada
    final purpleBox = Rect.fromLTRB(
        radiusPurple * 2, 20, size.width / 3, size.height - radiusPurple * 2);
    canvas.drawRect(purpleBox, purplePaint);

    // Texto - información

    final textSpan = TextSpan(
        text: time,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ));

    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: size.width / 3,
        maxWidth: size.width / 3,
      );

    textPainter.paint(
      canvas,
      const Offset(radiusPurple, 40),
    );

    const textSpanMin = TextSpan(
        text: 'min',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ));

    final textPainterMin = TextPainter(
        text: textSpanMin,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: size.width / 3,
        maxWidth: size.width / 3,
      );

    textPainter.paint(
      canvas,
      const Offset(radiusPurple, 40),
    );
    textPainterMin.paint(
      canvas,
      const Offset(radiusPurple, 75),
    );

    // Dirección

    // Texto - información

    final textSpanInformation = TextSpan(
        text: place,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ));

    final textPainterInformation = TextPainter(
        text: textSpanInformation,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout(
        minWidth: size.width - radiusPurple - 10,
        maxWidth: size.width - radiusPurple - 10,
      );

    textPainter.paint(
      canvas,
      const Offset(radiusPurple, 40),
    );

    textPainterInformation.paint(
      canvas,
      Offset(radiusPurple + size.width / 3, size.height / 3),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
