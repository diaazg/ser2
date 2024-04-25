import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  
  Future<Either<Failure,UserModelInfo>> register(UserModelInfo userModelReg) ;
  Future<Either<Failure,UserModelInfo>> logIn (UserModelLog infoLog) ;
  Stream<User?>get user ;
  void logOut();
  

}

