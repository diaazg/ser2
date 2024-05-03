abstract class AllDoctorsEvent {}

class SetSpeciality extends AllDoctorsEvent{
  final String special ;

  SetSpeciality({required this.special});

}



class GetDoctorsBySpecialEvent extends AllDoctorsEvent {
  final String special ;

  GetDoctorsBySpecialEvent({required this.special});
}

class FilterSearchEvent extends AllDoctorsEvent {
  final Map<String,String> filter;

  FilterSearchEvent({required this.filter});
}

