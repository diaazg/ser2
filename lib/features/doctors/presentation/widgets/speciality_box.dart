import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/doctorsEvent.dart';

class SpecialBox extends StatelessWidget {
  const SpecialBox({
    super.key,

    required this.size, required this.index, required this.bloc,
  });


  final Size size;
  final int index ;

  final AllDoctorsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
                                             String  chooseSpecial = bloc.special[index];
          bloc.add(SetSpeciality(special: chooseSpecial)); 
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: size.height * 0.09 * 0.75,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:bloc.specialiy == bloc.special[index]
                ? Kcolors.blueBackground
                : const Color(0xFFEAEBEC)),
        child: Center(
          child: Text(
           bloc.special[index],
            style: Kcolors.fontMain.copyWith(
                color: bloc.specialiy == bloc.special[index]
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

