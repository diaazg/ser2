abstract class AllDoctorsEvent {}

class SetSpeciality extends AllDoctorsEvent{
  final String special ;

  SetSpeciality({required this.special});

}

class GetNearbyDoctorsEvent extends AllDoctorsEvent {
  final String wilaya;

  GetNearbyDoctorsEvent({required this.wilaya});
}

class GetDoctorsBySpecialEvent extends AllDoctorsEvent {
  final String special ;

  GetDoctorsBySpecialEvent({required this.special});
}