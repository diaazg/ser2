import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({
    super.key,
    required this.size,
    required this.id,
  });

  final Size size;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: size.height * 0.65 * 0.6,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color(0xFF6BA4D9),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: QrImageView(
          data: id,
          size: 280,
    
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(
              100,
              100,
            ),
          ),
        ),
      ),
    );
  }
}

