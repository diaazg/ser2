import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/data/repos/doctors_repo.dart';

class DoctorsRepoImp implements DoctorsRepoAbs{
    final FirebaseFirestore storeInstance;

  DoctorsRepoImp({required this.storeInstance});
  @override
  Future<Either<Failure, List<DoctorModel>>> getDoctorsBySpecial(String special) async {
    try {
       
       CollectionReference doctorsCollection = storeInstance.collection('doctors');

       QuerySnapshot querySnapshot = await doctorsCollection.get();

      List<DoctorModel> doctorsList =    querySnapshot.docs
      .map((doc) => DoctorModel.fromJson(doc.data() as Map<String,dynamic>))
      .toList();
       return right(doctorsList); 
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

  @override
  Future<Either<Failure, List<DoctorModel>>> getNearbyDoctors(String wilaya) async{
     try {
       
       CollectionReference doctorsCollection = storeInstance.collection('doctors');

       QuerySnapshot querySnapshot = await doctorsCollection.where('Wilaya' , isEqualTo: wilaya).get();
       

      List<DoctorModel> doctorsList =    querySnapshot.docs
      .map((doc) => DoctorModel.fromJson(doc.data() as Map<String,dynamic>))
      .toList();
       return right(doctorsList); 
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
}