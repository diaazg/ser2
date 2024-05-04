import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';

class AddMedicDay extends StatelessWidget {
  const AddMedicDay({
    super.key,
    required this.size,
    required this.isChoose,
    required this.day,
    this.chooseDay,
  });

  final Size size;
  final bool isChoose;
  final String day;
  final Function()? chooseDay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chooseDay,
      child: Container(
        color: isChoose ? const Color(0xFF6694F6) : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 5),
        width: size.width * 0.12,
        child: Center(
          child: Text(
            day,
            style: Kcolors.fontMain.copyWith(color: Colors.black,fontSize: 18),
          ),
        ),
      ),
    );
  }
}
