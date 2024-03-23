import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/splash_paint.dart';

class SplashPageElement extends StatelessWidget {
  const SplashPageElement(
      {super.key,
      required this.size,
      required this.img,
      required this.title,
      required this.description});
  final int img;
  final Size size;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: size.width,
      child: CustomPaint(
        painter: CurvePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "images/splash/$img.png",
                height: 300,
                width: size.width,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  description,
                  style: Kconstants.fontMain,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
