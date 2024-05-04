import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/doctors/data/repos/doctors_repo_imp.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/homePage/presentation/logic/doctorsEvent.dart';

class NearbyDoctorsBloc extends Bloc<NearbyDoctorsEvent,NearbyDoctorsState>{
    final DoctorsRepoImp doctorsRepo ;
  NearbyDoctorsBloc(this.doctorsRepo):super(InitialState()){
        on<GetNearbyDoctorsEvent>((event, emit) async{
      emit(NearbyLoading());

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

  }



}