import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/profile/data/models/medical_history_model.dart';
import 'package:ser2/features/profile/data/repo/medicalHistory/medical_history.dart';

class MedicalHistoryRepo extends MedicalHistoryRepoAbs{
  final FirebaseFirestore storeInstance;
  final String uid;

  MedicalHistoryRepo(this.uid, {required this.storeInstance});
  @override
  Future<Either<Failure, List<MedicalHistoryModel>>> getMedicalHistory() async {

    try {
      
      CollectionReference medicalCollection =
          storeInstance.collection('users').doc(uid).collection('medicalHistory');
       QuerySnapshot querySnapshot = await medicalCollection.get(); 
 

      List<MedicalHistoryModel> medicalHistory = querySnapshot.docs.map((doc) {
           print('iiiiiiiiiiiiiiiiiiiii');  
       print(doc.data());
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return MedicalHistoryModel.fromJson(data);
    }).toList();
       return right( medicalHistory);  
 
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {

      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
}