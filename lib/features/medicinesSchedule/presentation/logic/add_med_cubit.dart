import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class AddMedicineBloc extends Cubit<AddMedicinState> {
  AddMedicineBloc() : super(InitStateAddMed());

  Map<String, bool> choosenDays = {
    'Sat': false,
    'Sun': false,
    'Mon': false,
    'Thu': false,
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
  String? endDate;
  String? startDate;

  Map<String, TimeOfDay?> myDoses = {
    'dose1': null,
    'dose2': null,
    'dose3': null
  };

  //setters
  void setInput(String? userInput) {
    input = userInput;
  }

  void setStartDate(String? inputStartDate) {
    startDate = inputStartDate;
  }

  void setFinDate(String? inputFinDate) {
    endDate = inputFinDate;
  }

  void setDose(TimeOfDay? dose, int number) {
    switch (number) {
      case 1:
        myDoses['dose1'] = dose;
        emit(ValidateInputState());
        break;
      case 2:
        myDoses['dose2'] = dose;
        emit(ValidateInputState());
        break;
      case 3:
        myDoses['dose3'] = dose;
        emit(ValidateInputState());
        break;
    }
  }

  void validateDoseQuantity() {
    if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateMedicine() {
    if (input != null && input != '') {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateStartDate() {
    final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (startDate == null) {
      emit(UnValidateInputState());
    } else if (dateRegex.hasMatch(startDate!)) {
 emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateEndDate() {
    final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (endDate == null) {
      emit(UnValidateInputState());
    } else if (dateRegex.hasMatch(endDate!)) {
              emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  void validateType() {
    if (input != null) {
      emit(ValidateInputState());
    } else {
      emit(UnValidateInputState());
    }
  }

  bool validateDos() {
    if (myDoses['dose1'] != null ||
        myDoses['dose2'] != null ||
        myDoses['dose3'] != null) {
      return true;
    } else {
      return false;
    }
  }

  bool validateDay() {
    bool hasTrue = false;
    for (var value in choosenDays.values) {
      if (value) {
        hasTrue = true;
        break;
      }
    }
    return hasTrue;
  }

  bool checkDose(int nbr) {
    bool value = false;
    switch (nbr) {
      case 1:
        if (myDoses['dose1'] != null && nbr == 1) {
          value = true;
        }
        break;
      case 2:
        if (myDoses['dose2'] != null && nbr == 2) {
          value = true;
        }
      case 3:
        if (myDoses['dose3'] != null && nbr == 3) {
          value = true;
        }
    }

    return value;
  }

  TimeOfDay? getDose(int val) {
    if (val == 1) {
      return myDoses['dose1'];
    } else if (val == 2) {
      return myDoses['dose2'];
    } else {
      return myDoses['dose3'];
    }
  }
}
