import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/abstract_logic.dart';
import './box_state.dart';

class BoxBloc extends Cubit<BoxState> implements BoxAbstract {
  BoxBloc() : super(BoxValidateState());

  String? input;
  void setInput(String? changeInput) {
    input = changeInput;
  }

  @override
  void validateEmail() {
    if (input != null &&
        input != '' &&
        input!.contains("@") &&
        input!.contains(".") &&
        input!.length > 4) {
      emit(BoxValidateState());
    } else {
      emit(BoxUnValidState());
    }
  }

  @override
  void validatePassword() {
    if (input != null && input != '' && input!.length > 5) {
      emit(BoxValidateState());
    } else {
      emit(BoxUnValidState());
    }
  }

  @override
  void checkPassword(String? password) {
    if (password == input) {
      emit(BoxValidateState());
    } else {
      emit(BoxUnValidState());
    }
  }

  @override
  void validateUserName() {
    if (input == null) {
      emit(BoxUnValidState());
    } else {
      if (input!.contains(RegExp('[1-9]'))) {
        emit(BoxUnValidState());
      } else {
        emit(BoxValidateState());
      }
    }
  }

  @override
  void validDouble() {
    try {
       double.parse(input!);
      emit(BoxValidateState());
    } catch (e) {
      emit(BoxUnValidState());
    }
  }
  
  
  @override
  void validateDate() {
        final dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$');
    if (input == null) {
      emit(BoxUnValidState());
    } else if (dateRegex.hasMatch(input!)) {
      emit(BoxValidateState());
    } else {
      emit(BoxUnValidState());
    }
  }
}
