// ignore: file_names

import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';

abstract class AllDoctorsState {}

class InitialState extends AllDoctorsState {}

class DoctorLoading extends AllDoctorsState  {}

class SpecialLoading extends AllDoctorsState {}

class ChangeSpecialState extends AllDoctorsState{
  final List<DoctorModel> doctors ;

  ChangeSpecialState({required this.doctors});
}

class NearbyLoading extends AllDoctorsState {}

class DoctorSpecialSuccess extends AllDoctorsState  {
  final List<DoctorModel> doctors;

  DoctorSpecialSuccess({required this.doctors});
}
class DoctorSpecialFailure extends AllDoctorsState  {
   final Failure failure ;

  DoctorSpecialFailure ({required this.failure});
}

class DoctorNearbySuccess extends AllDoctorsState  {
  final List<DoctorModel> doctors;

  DoctorNearbySuccess({required this.doctors});
}


class DoctorNearbyFailure extends AllDoctorsState  {
   final Failure failure ;

  DoctorNearbyFailure({required this.failure});
}