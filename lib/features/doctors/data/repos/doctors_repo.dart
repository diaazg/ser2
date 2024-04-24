import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';

abstract class DoctorsRepoAbs {

  Future<Either<Failure,List<DoctorModel>>> getNearbyDoctors(String wilaya);

  Future<Either<Failure,List<DoctorModel>>> getDoctorsBySpecial(String special);
  
  

}