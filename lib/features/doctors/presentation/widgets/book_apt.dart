import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/data/repos/appointment_imp.dart';
import 'package:ser2/features/appointment/data/repos/appointment_repo_abs.dart';
import 'package:ser2/features/appointment/presentation/logic/appointment_bloc.dart';
import 'package:ser2/features/appointment/presentation/view/apt_information.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';

class BookAptButton extends StatelessWidget {
   BookAptButton({
    super.key,
    required this.size, required this.doctor, required this.uid,
    
  });

  final Size size;
  final DoctorModel doctor;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppointmentRepo repo = AppointmentRepo();
        AppointmentBloc bloc = AppointmentBloc(repo,doctor.id) ;
        bloc.setToday();
         Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  AppointmentPage(
 uid: uid,
                      bloc: bloc, doctorModel: doctor,
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
