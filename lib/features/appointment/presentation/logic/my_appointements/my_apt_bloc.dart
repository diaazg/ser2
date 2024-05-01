import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/appointment/data/repos/appointment_imp.dart';
import 'package:ser2/features/appointment/presentation/logic/my_appointements/my_apt_state.dart';

class MyAptBloc extends Cubit<MyAptState> {
  MyAptBloc(this.uid, this.repo) : super(MyAptInit());
  final String uid;
  final AppointmentRepo repo;

  void getMyApt() async {
    
    emit(MyAptLoading());

    var response = await repo.myAppointments(uid);

    response.fold((failure) {
      emit(MyAptFailure(failure: failure));
    }, (success) {
      emit(MyAptSuccess(aptList: success));
    });
  }
}
