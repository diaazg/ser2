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
  void validatePassword(){
        if (input != null && input != '' && input!.length > 5) {
        emit(BoxValidateState());
      } else {
        emit(BoxUnValidState());
      }
  }

  

}