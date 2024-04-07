// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';

class AllDoctorsBloc extends Cubit<AllDoctorsState>{
  AllDoctorsBloc():super(InitialState());

    List<String> special = [
    "Urology",
    "Neurology",
    "Ophtalmology",
    "Cardiology",
    "Dentist",
    "Gastroenterologist",
    "Gynecologist",
    "Pulmonologist"
  ];

  String specialiy = "Urology";

  void setSpecial(String choosenSpecial){
    specialiy = choosenSpecial ;
    emit(ChangeSpecialState(doctorsList: []));
  }



}