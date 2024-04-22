import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/wilaya.dart';
import 'package:ser2/features/auth/presentation/logic/abstract_logic.dart';
import './box_state.dart';

class BoxBloc extends Cubit<BoxState> implements BoxAbstract {
  BoxBloc() : super(BoxInitState());

  String? input;
  String? city;
  String? town;
  Set allSet = wilaya;
  List<String> wilayat=["Adrar"];
  List<String> communes =["choose wilaya"];

  void setWilayaList (){
    wilayat.clear();
    for (var element in allSet) {
     String wilayaName = element["name"];
     wilayat.add(wilayaName); 
    }
    emit(BoxInitState());
  }

  void setWilaya(String wilayaChoosed){
    city = wilayaChoosed;
    String wilayaName = '';
    communes.clear();
    for (var element in allSet) {
      wilayaName = element["name"];
      if(wilayaName == wilayaChoosed){
         List communesList = element["communes"];
         for (var commune in communesList) {
           communes.add(commune["name"]);
         }
        break;
      }
    }
    emit(BoxInitState());
    
  }
  void setCommune(String communeChoosed){
    town = communeChoosed;
    emit(BoxInitState());
  }
  void setInput(String? changeInput) {
    input = changeInput;
  }
  void validateWilaya(){
    if(city != null && city != ''){
      emit(BoxValidateState());
    }else{
      emit(BoxUnValidState());
    }
  }
  void validateCommune(){
      if(town != null && town != ''){
      emit(BoxValidateState());
    }else{
      emit(BoxUnValidState());
    }
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
  void validateDouble() {
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
