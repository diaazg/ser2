import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/profile/data/models/medical_history_model.dart';

abstract class MedicalHistoryRepoAbs {
     Future<Either<Failure,List<MedicalHistoryModel>>> getMedicalHistory ();
  

}


