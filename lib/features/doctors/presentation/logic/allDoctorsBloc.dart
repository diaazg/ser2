
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
    on<FilterSearchEvent>((event, emit)async{
      emit(SpecialLoading());
      var response = await doctorsRepo.doctorsFilter(specialiy, event.filter);
        response.fold((failure){
                emit(DoctorSpecialFailure(failure: failure));
               }, (success){

                emit(DoctorSpecialSuccess(doctors: success));
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
    "Pulmonologist",
    'Pediatrics'
  ];

  String specialiy = "Urology";


  

  void setSpecial(String choosenSpecial){
    specialiy = choosenSpecial ;

  }
   
    


}