import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/appointment/data/models/appointment_model.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';

abstract class AppointmentRepoAbs {

  Future<Either<Failure,List<AppointmentModel>>> fecthAppointmentInfo(String medcinUid);
  Future<Either<Failure, int>> reserve(String medcinUid, String day, String maladUid, bool isToday);
  Future<Either<Failure,List<RenduVousModel>>> myAppointments(String userId); 

}