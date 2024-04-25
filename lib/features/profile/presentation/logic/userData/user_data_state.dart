import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class UserDataState {}

class UserDataInit extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataGetSuccessfull extends UserDataState {
  final UserModelInfo userModelInfo ;

  UserDataGetSuccessfull({required this.userModelInfo});
}

class UserDataGetFailure extends UserDataState {
  final Failure failure;

  UserDataGetFailure({required this.failure});
}
