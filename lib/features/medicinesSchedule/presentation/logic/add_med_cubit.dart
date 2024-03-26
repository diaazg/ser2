import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class AddMedicineBloc extends Cubit<AddMedicinState>{
  AddMedicineBloc():super(InitStateAddMed());

  Map<String,bool> choosenDays = {
    'Sat':false,
    'Sun':false,
    'Mon':false,
    'Thi':false,
    'Wed':false,
    'Tue':false,
    'Fri':false 

  }; 

  void chooseDay(String day){
    bool previous = choosenDays[day]!;
    choosenDays[day]=!previous;
    emit(ChooseDayState());
  }

}