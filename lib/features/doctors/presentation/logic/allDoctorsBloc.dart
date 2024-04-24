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
                emit(DoctorSpecialSuccess(doctors: success));
               } );
    },);
        on<GetNearbyDoctorsEvent>((event, emit) async{
      emit(DoctorLoading());

      var response = await doctorsRepo.getNearbyDoctors(event.wilaya);
        response.fold((failure){

                emit(DoctorNearbyFailure(failure: failure));
               }, (success){
               
                emit(DoctorNearbySuccess(doctors: success));
               } );
    });
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
    emit(ChangeSpecialState(doctors: []));
  }



}