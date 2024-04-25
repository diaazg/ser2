import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
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

   Future<Either<Failure, UserModelInfo>> getUserdata(String uid) async {
    try {

      DocumentReference documentReference =
          authRepo.storeInstance.collection('users').doc(uid);
      dynamic documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        dynamic json = documentSnapshot.data()!;
        UserModelInfo userModel = UserModelInfo.fromJson(json);
        return right(userModel);
      } else {
        return left(
            FirebaseFailure(errMessage: 'Oops error occurred try later'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      // Handle other non-Firebase exceptions (e.g., network errors)
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

  @override 
  Future<void> close (){
    _userSubscription.cancel();
    return super.close();
  }

}