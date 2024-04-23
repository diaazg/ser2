import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';

abstract class AuthBlocAbstract {

  Future<Either<Failure, UserModelReg>> login(UserModelLog userLog);
  Future<Either<Failure, UserModelReg>>  register(UserModelReg userReg);
  void forgotPassword();
}