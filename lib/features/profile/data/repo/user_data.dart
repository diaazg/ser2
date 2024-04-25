import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class UserDataRepo {
  
    Future<Either<Failure, UserModelInfo>> getUserData(String uid);

}