import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/presentation/logic/apointment_state.dart';

class AppointmentBloc extends Cubit<AppointmentState>{
  AppointmentBloc(): super(AppointmentStateInit());
  
  Day day = Day.today;

  int todayCount = 10 ;

  int tomorrowCount = 20 ;

  

  late int countDown ;


  void setToday (){
    countDown = todayCount ;
    day = Day.today ;
    emit(AppointmentStateChanged());
  }

  void setTomorrow () {
    countDown = tomorrowCount ;
    day = Day.tomorrow ;
    emit(AppointmentStateChanged());
  }


}