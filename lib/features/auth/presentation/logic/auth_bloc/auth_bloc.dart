import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/abstarct_auth.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> implements AuthBlocAbstract {

  final AuthRepoImp authRepo;
  AuthBloc(this.authRepo):super(AuthInit()){
    on<LoginEvent>((event, emit)async {
        emit(LoginLoading());
              var response = await login(event.userModelLog);
               response.fold((failure){
                emit(LoginFailure(failure: failure));
               }, (success){
                emit(LoginSucces(userModelReg:success));
               } );
    });
    on<RegisterEvent>((event, emit)async {
              emit(RegisterLoading());
              var response = await register(event.userModelReg);
               response.fold((failure){
                emit(RegisterFailure(failure: failure));
               }, (success){
                emit(RegisterSuccess(userModelReg: success));
                
               } );
    });
    on<LogOutEvent>((event, emit) {
      
      authRepo.logOut();
    });

  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  Future<Either<Failure, UserModelReg>> login(UserModelLog userLog) async {
         return await authRepo.logIn(userLog);
  }

  @override
  Future<Either<Failure, UserModelReg>>  register(UserModelReg userReg)async {
    return await authRepo.register(userReg);
  }


}