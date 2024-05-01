import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';
import 'package:ser2/features/medicinesSchedule/data/repo/medicines_repo_imp.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_state.dart';

class ScheduleBloc extends Cubit<ScheduleState>{
  ScheduleBloc(this.repo):super(InitScheduleState());
  final MedicineRepoImp  repo;

  String choosenDay = 'Sat';

  void chooseDay(String day)async{

    choosenDay = day ;
    emit(ChooseDayState());
    emit(ScheduleLoadingState());

    var response = await repo.fetchMedicines();

    response.fold((failure){

      emit(ScheduleFailureState(failure: failure));
    }, (success){

      List <MedicineModel> dayMedicines = success.where((element) => element.days.contains(choosenDay)).toList();

      emit(ScheduleSuccessState(medicinesList: dayMedicines));
    });
  }

  

}