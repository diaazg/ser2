import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/wilaya.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_event.dart';
import 'package:ser2/features/doctors/presentation/logic/filter_bloc/filter_state.dart';

class FilterBloc extends Bloc<FilterEvnet, FilterState> {
  FilterBloc() : super(InitFilter()) {
    on<SetOption>((event, emit) {
      setProp(event.prop, event.val);
      emit(SetOptionState());
    });

    on<InitWilayaList>((event, emit) {
      setWilayaList();
       emit(InitFilter());
    });
 
    on<SetWilaya>((event, emit) {
      setWilaya(event.choosenWilaya);
      emit(InitFilter());
    });
 
  }

  List<String> sexe = ['Male', 'Female'];
   

  Set allSet = wilaya;
  List<String> wilayat=["Adrar"];
  List<String> communes =["choose wilaya"];

  Map<String, bool> filterProps = {
    'Wilaya': false,
    'Commune': false,
    'Gender': false
  };

  Map<String, String> filterValues = {'Wilaya': '', 'Commune': '', 'Gender': ''};

  void setProp(String prop, bool val) {
    filterProps[prop] = val;
  }

  void setValue (String prop,String val){
    filterValues[prop]=val;
  }

  void setWilayaList (){
    wilayat.clear();
    for (var element in allSet) {
     String wilayaName = element["name"];
     wilayat.add(wilayaName); 
    }
   
  }

  void setWilaya(String wilayaChoosed){
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
   
    
  }

}


