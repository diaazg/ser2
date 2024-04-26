import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/profile/data/models/medical_history_model.dart';

abstract class MedicalHistoryState {}

class MedicalHistoryInit extends MedicalHistoryState {}

class MedicalHistoryLoading extends MedicalHistoryState {}


class MedicalHistorySuccess extends MedicalHistoryState {
 final List<MedicalHistoryModel> medicalHistory;

  MedicalHistorySuccess({required this.medicalHistory});
}

class MedicalHistoryFailure extends MedicalHistoryState {
  final Failure failure ;

  MedicalHistoryFailure({required this.failure});
}