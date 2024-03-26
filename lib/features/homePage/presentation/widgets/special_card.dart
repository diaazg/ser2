import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class SpecialCard extends StatelessWidget {
  const SpecialCard(
      {super.key,
      required this.size,
      required this.name,
      required this.pic,
      required this.color});

  final Size size;
  final String name;
  final String pic;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 5),
            height: size.height * 0.11,
            width: size.width * 0.25,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset("images/special/$pic.png"),
          ),
          Text(
            name,
            style:
                Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
          )
        ],
      ),
    );
  }
}
