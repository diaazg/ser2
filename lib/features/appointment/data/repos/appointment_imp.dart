import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/appointment/data/models/appointment_model.dart';
import 'package:ser2/features/appointment/data/repos/appointment_repo_abs.dart';

class AppointmentRepo extends AppointmentRepoAbs {
  FirebaseFirestore storeInstance = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<AppointmentModel>>> fecthAppointmentInfo(
      String medcinUid) async {
    try {
      CollectionReference medicalCollection =
          storeInstance.collection('doctors').doc(medcinUid).collection('days');
      QuerySnapshot querySnapshot = await medicalCollection.get();

      List<AppointmentModel> doctorSchedule = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return AppointmentModel.fromJson(data, doc.id);
      }).toList();
      return right(doctorSchedule);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

@override
  Future<Either<Failure, int>> reserve(String medcinUid, String day) async {
    try {
     late int nbr ;
      DocumentReference aptDoc = storeInstance
          .collection('doctors')
          .doc(medcinUid)
          .collection('days')
          .doc(day);

     await aptDoc.get().then((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          var data = snapshot.data() as Map<String, dynamic>;
          
           nbr = data['Nb'];
        }else{
          nbr = 0;
        }
      });
     if(nbr>0){
     await aptDoc.update({'Nb':nbr-1});
      return right(nbr);
     }else{
      return left(FirebaseFailure(errMessage: 'Nombre de place insufisant'));
     }
     

    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {

      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }
}
