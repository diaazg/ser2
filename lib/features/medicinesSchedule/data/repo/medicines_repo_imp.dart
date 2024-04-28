import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';
import 'package:ser2/features/medicinesSchedule/data/repo/mdeicines_repos.dart';

class MedicineRepoImp extends MedicineRepoAbs {
  final FirebaseFirestore storeInstance = FirebaseFirestore.instance;
  final String uid;

  MedicineRepoImp({required this.uid});
  @override
  addMedicine(MedicineModel medicineModel) async {
    try {
      CollectionReference medicineCollection =
          storeInstance.collection('users').doc(uid).collection('medicines');
          print('llllllllll');
      await medicineCollection.add(medicineModel.toJson());
      return right('success');
    } on FirebaseAuthException catch (e) {
      
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

  @override
  Future<Either<Failure, MedicineModel>> fetchMedicines() {
    // TODO: implement fetchMedicines
    throw UnimplementedError();
  }
}
