import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_state.dart';

class ScheduleBloc extends Cubit<ScheduleState>{
  ScheduleBloc():super(InitScheduleState());

  String choosenDay = 'Sat';

  void chooseDay(String day){
    choosenDay = day ;
    emit(ChooseDayState());
  }

  

}