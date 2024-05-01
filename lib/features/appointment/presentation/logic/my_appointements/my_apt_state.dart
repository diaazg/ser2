import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';

abstract class MyAptState {}

class MyAptInit extends MyAptState {}

class MyAptLoading extends MyAptState {}

class MyAptSuccess extends MyAptState {
  final List<RenduVousModel>  aptList ;

  MyAptSuccess({required this.aptList});
}

class MyAptFailure extends MyAptState {
  final Failure failure ;

  MyAptFailure({required this.failure});
}
