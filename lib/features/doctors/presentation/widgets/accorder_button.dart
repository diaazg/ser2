import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';

class Accorder extends StatelessWidget {
  const Accorder({
    super.key, this.onPressed, 
  });
  
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Kcolors.blueBackground,
            elevation: 10),
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text(
            'Accorder',
            style: TextStyle(
                color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
