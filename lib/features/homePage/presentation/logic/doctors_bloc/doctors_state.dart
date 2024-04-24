import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/homePage/data/models/doctor_Model.dart';

abstract class DoctorsState {}

class DoctorInitial extends DoctorsState {}

class DoctorLoading extends DoctorsState {}

class DoctorSuccess extends DoctorsState {
  final List<DoctorModel> doctors;

  DoctorSuccess({required this.doctors});
}

class DoctorsFailure extends DoctorsState {
   final Failure failure ;

  DoctorsFailure({required this.failure});
}