import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';

abstract class ScheduleState {}

class InitScheduleState extends ScheduleState {}

class ChooseDayState extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {

}

class ScheduleSuccessState extends ScheduleState {
  final List<MedicineModel> medicinesList ;

  ScheduleSuccessState({required this.medicinesList});
}

class ScheduleFailureState extends ScheduleState {
  final Failure failure ;

  ScheduleFailureState({required this.failure});
}
