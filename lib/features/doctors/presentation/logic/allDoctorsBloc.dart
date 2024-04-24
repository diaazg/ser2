// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/doctors/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/doctors/data/repos/doctors_repo_imp.dart';

class AllDoctorsBloc extends Bloc<AllDoctorsEvent,AllDoctorsState>{
    final DoctorsRepoImp doctorsRepo ;
  AllDoctorsBloc(this.doctorsRepo):super(InitialState()){
    on<SetSpeciality>((event, emit) async{
      setSpecial(event.special);
      emit(SpecialLoading());
      var response = await doctorsRepo.getDoctorsBySpecial(event.special);
        response.fold((failure){
                emit(DoctorSpecialFailure(failure: failure));
               }, (success){
                print('ssssssssssssssssssssss');
                print(success);
                print('sssssssssssssssssss');
                emit(DoctorSpecialSuccess(doctors: success));
               } );
    },);

  }

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

  }



}