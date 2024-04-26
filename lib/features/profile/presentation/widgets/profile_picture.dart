import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key, required this.imgUrl, required this.height, required this.width,
  });
  final String? imgUrl ;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xFF6694F6),
          borderRadius: BorderRadius.circular(300)),
      child:  Center(
        child: CircleAvatar(
          radius: 100,
           backgroundImage: imgUrl==''?null:NetworkImage(imgUrl!)
        ),
      ),
    );
  }
}

