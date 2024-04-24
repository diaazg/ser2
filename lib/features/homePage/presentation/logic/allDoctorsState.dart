// ignore: file_names

import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';

abstract class NearbyDoctorsState {}

class InitialState extends NearbyDoctorsState {}






class NearbyLoading extends NearbyDoctorsState {}



class DoctorNearbySuccess extends NearbyDoctorsState  {
  final List<DoctorModel> doctors;

  DoctorNearbySuccess({required this.doctors});
}


class DoctorNearbyFailure extends NearbyDoctorsState  {
   final Failure failure ;

  DoctorNearbyFailure({required this.failure});
}