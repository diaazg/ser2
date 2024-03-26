import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.size, required this.title});
  final Size size ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
                    title,
                    style: Kcolors.fontMain
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
      ],
    );
  }
}