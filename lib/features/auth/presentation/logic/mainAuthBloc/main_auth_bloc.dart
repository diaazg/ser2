import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_event.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_state.dart';

class MainAuthBloc extends Bloc<MainAuthEvent,MainAuthState> {
  final AuthRepoImp authRepo;
  late final StreamSubscription<User?> _userSubscription; 
  MainAuthBloc(this.authRepo):super(const MainAuthState.unknown()){
    _userSubscription = authRepo.user.listen((authUser) { 
      add(AuthUserChanged(user: authUser));
    });
    on<AuthUserChanged>((event, emit) {
        if(event.user != null){
          emit(MainAuthState.authentificated(event.user!));
        }else{
          emit(const MainAuthState.unauthentificated());
        }

    });
  }

  @override 
  Future<void> close (){
    _userSubscription.cancel();
    return super.close();
  }

}