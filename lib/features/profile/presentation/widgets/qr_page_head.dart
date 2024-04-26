import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/profile/presentation/widgets/profile_picture.dart';

class QrPageHead extends StatelessWidget {
  const QrPageHead({
    super.key,
    required this.size, required this.img, required this.userName,
  });

  final Size size;
  final String img ;
  final String userName ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.05,
        ),
        Center(
            child: ProfilePicture(imgUrl: img, height: 100, width: 100)
          ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                  userName,
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),

          ],
        )
      ],
    );
  }
}

