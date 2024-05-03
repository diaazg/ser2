import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';


/* this widget used in profile page which containe malad informations like full name , date of birth , height , width ...etc */

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {super.key,
      required this.size,
      required this.title,
      required this.content,
      required this.height,
      required this.width});
  final Size size;
  final String title;
  final String content;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          
            overflow: TextOverflow.fade,
  softWrap: false,
          title,
          style: Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height * height,
          width: size.width * width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Container(
                height: size.height * height,
                width: size.width * width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Center(
                    child: Text(
                      content,
                      style: Kcolors.fontMain
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
