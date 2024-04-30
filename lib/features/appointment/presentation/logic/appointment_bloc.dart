import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/data/repos/appointment_imp.dart';
import 'package:ser2/features/appointment/presentation/logic/apointment_state.dart';

class AppointmentBloc extends Cubit<AppointmentState>{
  AppointmentBloc(this.appRepo, this.medcinUid): super(AppointmentStateInit());
    final AppointmentRepo appRepo ;
    final String medcinUid ;
   final Map<String, String> englishToFrenchDays = {
      'Monday': 'lundi',
      'Tuesday': 'mardi',
      'Wednesday': 'mercredi',
      'Thursday': 'jeudi',
      'Friday': 'vendredi',
      'Saturday': 'samedi',
      'Sunday': 'dimanche',
    };

  Day day = Day.today;

  late int todayCount  ;

  late int tomorrowCount ;

  

  late int countDown ;




  void setToday ()async{
    
    day = Day.today ;
    emit(AppointmentStateChanged());
    emit(AppointmentStateLoading());
    var response = await appRepo.fecthAppointmentInfo(medcinUid);
    response.fold((failure){
        emit(AppointmentStateFailure());
    }, (success){
    DateTime now = DateTime.now();
    String? todayName = DateFormat('EEEE').format(now);
     todayName = englishToFrenchDays[todayName];
        int todayIndex= success.indexWhere((element) => (element.day == todayName));
        countDown = success[todayIndex].nbr;
        emit(AppointmentStateSucces());
    });
    
  }

  void setTomorrow () async{
    
    day = Day.tomorrow ;
    emit(AppointmentStateChanged());
        emit(AppointmentStateChanged());
    emit(AppointmentStateLoading());
    var response = await appRepo.fecthAppointmentInfo(medcinUid);
    response.fold((failure){
        emit(AppointmentStateFailure());
    }, (success){
            DateTime now = DateTime.now().add(const Duration(days: 1));
    String? tomorrowName = DateFormat('EEEE').format(now);
     tomorrowName = englishToFrenchDays[tomorrowName];
        int tomorrowIndex= success.indexWhere((element) => (element.day == tomorrowName));
        countDown = success[tomorrowIndex].nbr;
        emit(AppointmentStateSucces());
    });
  }


  void reserveApt(String maladUid)async{
    emit(AppointmentStateLoading());
    if(day == Day.today){
          DateTime now = DateTime.now();
    String? todayName = DateFormat('EEEE').format(now);
     todayName = englishToFrenchDays[todayName];
     var response = await appRepo.reserve(medcinUid, todayName!,maladUid,true);
    response.fold((failure){
        emit(ReserveFailure(err: failure.errMessage));
    }, (success){
        emit(ReserveSuccess(myTurn: success));
        setToday();
    });
    
    }else{
    DateTime now = DateTime.now().add(const Duration(days: 1));
    String? tomorrowName = DateFormat('EEEE').format(now);
     tomorrowName = englishToFrenchDays[tomorrowName];
 var response = await appRepo.reserve(medcinUid, tomorrowName!,maladUid,false);
    response.fold((failure){
        emit(ReserveFailure(err: failure.errMessage));
    }, (success){
        emit(ReserveSuccess(myTurn: success));
        setTomorrow();
    });
    }
  }

}