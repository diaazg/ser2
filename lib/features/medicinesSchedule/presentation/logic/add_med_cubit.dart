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
  String? endDate ;
  String? startDate ;

  String? dose_1 ;
  String? dose_2 ;
  String? dose_3 ;

  
  
 
 

  //setters
  void setInput(String? userInput) {
    input = userInput;
  }
  void setStartDate(String? inputStartDate){
    startDate = inputStartDate;
  }
  void setFinDate(String? inputFinDate){
    endDate = inputFinDate ;
  }
  void setDose(String? dose ,int number){
    switch (number) {
      case 1:
        dose_1 = dose;
        break;
      case 2:
        dose_2 = dose;
        break;
      case 3:
        dose_3 = dose;
        break;
      
    }
  }

 
  void validateDoseQuantity(){
      if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateMedicine() {
    if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateStartDate() {
    final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (input == null) {
      emit(UnValidateInputState());
    } else if (dateRegex.hasMatch(startDate!)) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }
  void validateEndDate(){
        final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (input == null) {
      emit(UnValidateInputState());
    } else if (dateRegex.hasMatch(endDate!)) {
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
 
  void validateDos(){
    if(dose_1 != null || dose_2 != null || dose_3 != null){
         emit(ValidateInputState());
    }else{
         emit(UnValidateInputState());
    }
  }
  
}

