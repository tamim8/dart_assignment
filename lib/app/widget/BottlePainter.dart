import 'package:flutter/material.dart';

class BottlePainter extends CustomPainter {
  final double fillPercentage;

  BottlePainter(this.fillPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    Path bottlePath = Path();
    // Define the bottle shape here using moveTo, lineTo, etc.
    // Example:
    bottlePath.moveTo(size.width * 0.2, size.height);
    bottlePath.lineTo(size.width * 0.2, size.height * 0.3);
    bottlePath.quadraticBezierTo(size.width * 0.5, size.height * 0.2,
        size.width * 0.8, size.height * 0.3);
    bottlePath.lineTo(size.width * 0.8, size.height);
    bottlePath.close();

    // Draw the water level
    canvas.drawPath(bottlePath, paint);

    // Draw measurement lines and other details
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
