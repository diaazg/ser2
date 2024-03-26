import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class IllnessCard extends StatelessWidget {
  const IllnessCard(
      {super.key,
      required this.size,
      required this.illName,
      required this.periode,
      required this.pic});

  final Size size;
  final int pic;
  final String illName;
  final String periode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: size.height * 0.8 * 0.2,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "images/MedicalRep/$pic.png",
                height: size.height * 0.8 * 0.2 * 0.8,
                width: size.width * 0.3,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      illName,
                      style: Kcolors.fontMain.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      periode,
                      style: Kcolors.fontMain.copyWith(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          ),
          Icon(
            Icons.navigate_next,
            color: Colors.black38,
            size: 50,
          )
        ],
      ),
    );
  }
}
