import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/profile/data/repo/medicalHistory/medical_history_imp.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_event.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_state.dart';

class MedicalHistoryBloc extends Bloc<MedicalHistoryEvent,MedicalHistoryState>{
   
   final MedicalHistoryRepo repo;

  MedicalHistoryBloc(this.repo):super(MedicalHistoryInit()){
    on<GetMedicalHistory>((event, emit) async{
     emit(MedicalHistoryLoading());
     var response = await repo.getMedicalHistory();
     response.fold((failure) {
       emit(MedicalHistoryFailure(failure: failure));
     }, (success) {
      emit(MedicalHistorySuccess(medicalHistory: success));
     });
    });
  }
}