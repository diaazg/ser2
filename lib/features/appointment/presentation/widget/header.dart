import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: size.height * 0.15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 60,
            height: 60,
            color: const Color(0xFFEAEBEC),
            child: const Center(child: Icon(Icons.navigate_before)),
          ),
        ),
        Center(
          child:  Text(
                "My appointements",
                style: Kcolors.fontMain.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
        )
      ],
    ),
                );
  }
}