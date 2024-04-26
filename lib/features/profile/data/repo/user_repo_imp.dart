import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/profile/data/repo/user_data.dart';

class UserDataRepoImp extends UserDataRepo{
  final FirebaseFirestore storeInstance ;

  UserDataRepoImp({required this.storeInstance});
  @override
  Future<Either<Failure, UserModelInfo>> getUserData(String uid)async {
       try {
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



}