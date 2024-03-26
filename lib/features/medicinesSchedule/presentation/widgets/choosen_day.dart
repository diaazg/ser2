import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class DayChoosen extends StatelessWidget {
  const DayChoosen({
    super.key, required this.size, required this.choosenDay, required this.day, this.choose,

  });

  final Size size;
  final String choosenDay;
  final String day ;
  final Function()? choose ; 
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: choose,
      child: SizedBox(
        height: 60,
        width: size.width * 0.14,
        child: Column(
          children: [
            Text(
              day,
              style: Kcolors.fontMain
                  .copyWith(color: Colors.black),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: choosenDay == day
                      ? const Color(0xFF6694F6)
                      : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
