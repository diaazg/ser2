import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
  
    paint.color = const Color(0xFF6694F6);
    paint.style = PaintingStyle.fill;

    var path = Path();

    
    path.moveTo(0, 500);
    path.lineTo(size.width * 0.05, 500);
    path.quadraticBezierTo(size.width * 0.5, 530, size.width * 0.95, 500);
    path.lineTo(size.width, 500);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
