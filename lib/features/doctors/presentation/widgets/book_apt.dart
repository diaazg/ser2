import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/presentation/logic/appointment_bloc.dart';
import 'package:ser2/features/appointment/presentation/view/apt_information.dart';

class BookAptButton extends StatelessWidget {
   BookAptButton({
    super.key,
    required this.size,
    
  });

  final Size size;
  final AppointmentBloc bloc = AppointmentBloc() ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.setToday();
         Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  AppointmentPage(
                  long:22.22,
                      lati: 22.22,
                      docName: 'docName',
                      id: 'id',
                      wilaya: 'wilaya',
                      commune: 'commune',
                      specialite: 'specialite',
                     ind: 2, bloc: bloc,
                    ))); 
    
      },
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: Kcolors.blueBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'book apt',
            style: Kcolors.fontMain.copyWith(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
