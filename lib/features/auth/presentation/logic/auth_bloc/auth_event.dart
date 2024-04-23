import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {

  final UserModelLog userModelLog ;

  LoginEvent({required this.userModelLog});
  
}

class RegisterEvent extends AuthEvent {

   final UserModelReg userModelReg ;

  RegisterEvent({required this.userModelReg});

}

class LogOutEvent extends AuthEvent {}

class ChangeUserEvent extends AuthEvent {
  final User? user;

  ChangeUserEvent({required this.user});

}
