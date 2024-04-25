import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class AuthState {}


class AuthInit extends AuthState {}



class LoginSucces extends AuthState {
  final UserModelInfo userModelReg;

  LoginSucces({required this.userModelReg});
}

class LoginFailure extends AuthState {
  final Failure failure;

  LoginFailure({required this.failure});
}

class LoginLoading extends AuthState {}




class RegisterSuccess extends AuthState {
  final UserModelInfo userModelReg;

  RegisterSuccess({required this.userModelReg});
}

class RegisterFailure extends AuthState {
  final Failure failure;

  RegisterFailure({required this.failure});
}

class RegisterLoading extends AuthState {}