abstract class AppointmentState {}

class AppointmentStateLoading extends AppointmentState {}

class AppointmentStateSucces extends AppointmentState {}

class AppointmentStateFailure extends AppointmentState {}

class AppointmentStateInit extends AppointmentState {}

class AppointmentStateChanged extends AppointmentState {}


class RserveLaoding extends AppointmentState {}

class ReserveSuccess extends AppointmentState {
  final int myTurn;

  ReserveSuccess({required this.myTurn});
}

class ReserveFailure extends AppointmentState {

  final String err;

  ReserveFailure({required this.err});

}
