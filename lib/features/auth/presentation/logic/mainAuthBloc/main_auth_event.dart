import 'package:firebase_auth/firebase_auth.dart';

abstract class MainAuthEvent {}

class AuthUserChanged extends MainAuthEvent {
  final User? user ;

  AuthUserChanged({required this.user});
}

