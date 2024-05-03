

import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
  final String medicineName;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> days;
  final String type;
  final double doseSize;
  final List<String> doses;
  final String id;

  MedicineModel(
      {required this.id,required this.medicineName,
      required this.startDate,
      required this.endDate,
      required this.days,
      required this.type,
      required this.doseSize,
      required this.doses});

  factory MedicineModel.fromJson(Map<String, dynamic> json,id) => MedicineModel(
    id:id,
      medicineName: json['medicineName'],
      startDate: (json['startDate'] as Timestamp).toDate(),
      endDate:  (json['endDate'] as Timestamp).toDate(),
      days:  (json['days'] as List<dynamic>).map((day) => day.toString()).toList(),
      type: json['type'],
      doseSize: json['doseSize'] as double,
      doses: (json['doses'] as List<dynamic>).map((dose) => dose.toString()).toList());


  Map<String,dynamic>toJson()=>{
    'medicineName':medicineName,
    'startDate':startDate,
    'endDate':endDate,
    'days':days,
    'type':type,
    'doseSize':doseSize,
    'doses':doses,
    'id':id

  };


}
