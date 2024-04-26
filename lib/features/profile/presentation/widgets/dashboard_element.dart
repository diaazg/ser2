import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class DashboardEelement extends StatelessWidget {
  const DashboardEelement({
    super.key,
    required this.size, this.onTap, required this.iconPath, required this.title,
  });

  final Size size;
  final Function()? onTap ; 
  final String iconPath ; 
  final String title ;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Image.asset("images/profile/icons/$iconPath.png"),
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                title ,
                style: Kcolors.fontMain.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}