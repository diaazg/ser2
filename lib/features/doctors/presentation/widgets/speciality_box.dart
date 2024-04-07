
import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';

class SpecialBox extends StatelessWidget {
  const SpecialBox({
    super.key,
    required this.allDoctorsBloc,
    required this.size, required this.index,
  });

  final AllDoctorsBloc allDoctorsBloc;
  final Size size;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         String  chooseSpecial = allDoctorsBloc.special[index];
          allDoctorsBloc.setSpecial(chooseSpecial);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: size.height * 0.09 * 0.75,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: allDoctorsBloc.specialiy == allDoctorsBloc.special[index]
                ? Kcolors.blueBackground
                : const Color(0xFFEAEBEC)),
        child: Center(
          child: Text(
            allDoctorsBloc.special[index],
            style: Kcolors.fontMain.copyWith(
                color: allDoctorsBloc.specialiy == allDoctorsBloc.special[index]
                    ? Colors.white
                    : Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

