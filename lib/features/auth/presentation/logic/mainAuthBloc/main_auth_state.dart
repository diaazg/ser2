import 'package:firebase_auth/firebase_auth.dart';

class MainAuthState {

  final MainAuthStatus status ; 
  final User? user ;

  const MainAuthState._({ this.status = MainAuthStatus.unknown,  this.user}); 

  const MainAuthState.unknown():this._();

  const MainAuthState.authentificated(User user):this._(status: MainAuthStatus.authentificated,user: user);

  const MainAuthState.unauthentificated():this._(status: MainAuthStatus.unauthenticated);



}


enum MainAuthStatus {unknown , authentificated , unauthenticated}