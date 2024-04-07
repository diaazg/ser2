// ignore: file_names

abstract class AllDoctorsState {}

class InitialState extends AllDoctorsState {}

class ChangeSpecialState extends AllDoctorsState {
  final List<dynamic>? doctorsList ;

  ChangeSpecialState({required this.doctorsList});
}



