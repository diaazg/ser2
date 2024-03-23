import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
  
    paint.color = const Color(0xFF6694F6);
    paint.style = PaintingStyle.fill;

    var path = Path();

    
    path.moveTo(0, 600);
    path.lineTo(size.width * 0.05, 600);
    path.quadraticBezierTo(size.width * 0.5, 630, size.width * 0.95, 600);
    path.lineTo(size.width, 600);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
