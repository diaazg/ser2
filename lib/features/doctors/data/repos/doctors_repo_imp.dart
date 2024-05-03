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

       QuerySnapshot querySnapshot = await doctorsCollection.where('Speciality' , isEqualTo: special).get();

    List<DoctorModel> doctorsList = querySnapshot.docs.map((doc) {

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;


      return DoctorModel.fromJson(data, id: doc.id);
      
    }).toList();
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
       
    List<DoctorModel> doctorsList = querySnapshot.docs.map((doc) {
     
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
 
      return DoctorModel.fromJson(data, id: doc.id);
    }).toList();
       return right(doctorsList); 
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
  
  @override
  Future<Either<Failure, List<DoctorModel>>> doctorsFilter(String special, Map<String, String> filter)async {
       try {
       
       CollectionReference doctorsCollection = storeInstance.collection('doctors');

        late  QuerySnapshot querySnapshot ;
       
          int propsLength = filter.keys.length;
       switch (propsLength) {
         case 1:

           querySnapshot = await doctorsCollection.where('Speciality' , isEqualTo: special)
           .where(filter.keys.toList()[0],isEqualTo: filter[filter.keys.toList()[0]])
           .get();
           break;
           
         case 2:
           querySnapshot = await doctorsCollection.where('Speciality' , isEqualTo: special)
           .where(filter.keys.toList()[0],isEqualTo: filter[filter.keys.toList()[0]])
           .where(filter.keys.toList()[1],isEqualTo: filter[filter.keys.toList()[1]])
           .get();
           break;

         case 3:
           querySnapshot = await doctorsCollection.where('Speciality' , isEqualTo: special)
           .where(filter.keys.toList()[0],isEqualTo: filter[filter.keys.toList()[0]])
           .where(filter.keys.toList()[1],isEqualTo: filter[filter.keys.toList()[1]])
           .where(filter.keys.toList()[2],isEqualTo: filter[filter.keys.toList()[2]])
           .get();
           break;     
         default:
       }


    List<DoctorModel> doctorsList = querySnapshot.docs.map((doc) {

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;


      return DoctorModel.fromJson(data, id: doc.id);
      
    }).toList();
       return right(doctorsList); 
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
}