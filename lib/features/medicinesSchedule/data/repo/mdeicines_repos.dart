import 'package:dartz/dartz.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';

abstract class MedicineRepoAbs {
  
  
  Future<Either<Failure,String>>  addMedicine(MedicineModel medicineModel);
  Future<Either<Failure,MedicineModel>> fetchMedicines();
  
}