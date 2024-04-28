import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuth authInstance;
  final FirebaseFirestore storeInstance;

  AuthRepoImp({required this.authInstance, required this.storeInstance});

  @override
  Future<Either<Failure, UserModelInfo>> logIn(UserModelLog infoLog) async {
    try {
      UserCredential userCredential =
          await authInstance.signInWithEmailAndPassword(
              email: infoLog.email!, password: infoLog.password!);

      String? uid = userCredential.user?.uid;
      DocumentReference documentReference =
          storeInstance.collection('users').doc(uid);
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
  Future<Either<Failure, UserModelInfo>> register(
      UserModelInfo userModelReg) async {
    try {
      UserCredential userCredential =
          await authInstance.createUserWithEmailAndPassword(
              email: userModelReg.email!, password: userModelReg.password!);

      String? uid = userCredential.user?.uid;
      DocumentReference documentReference =
          storeInstance.collection('users').doc(uid);
      userModelReg.uid = uid;
      
      await documentReference.set(userModelReg.toJson());
      return right(userModelReg);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      // Handle other non-Firebase exceptions (e.g., network errors)
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
  
  @override

  Stream<User?> get user {
    return authInstance.authStateChanges().map((firebaseUser){
      final user = firebaseUser ;
      return user ;
    } );
  }
  
  @override
  void logOut()async {
   await authInstance.signOut();
  }
}
