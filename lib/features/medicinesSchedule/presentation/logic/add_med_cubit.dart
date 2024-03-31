import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class AddMedicineBloc extends Cubit<AddMedicinState> {
  AddMedicineBloc() : super(InitStateAddMed());

  Map<String, bool> choosenDays = {
    'Sat': false,
    'Sun': false,
    'Mon': false,
    'Thi': false,
    'Wed': false,
    'Tue': false,
    'Fri': false
  };

  void chooseDay(String day) {
    bool previous = choosenDays[day]!;
    choosenDays[day] = !previous;
    emit(ChooseDayState());
  }

  String? input;

  void setInput(String? userInput) {
    input = userInput;
  }

  void validateMedicine() {
    if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateDate() {
    final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (input == null) {
      emit(UnValidateInputState());
    } else if (dateRegex.hasMatch(input!)) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateType(){
        if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }
 
  

}

