import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalHistoryModel {
  final String docId;
  final String illName;
  final String type;
  final Timestamp date; 

  MedicalHistoryModel({
    required this.docId,
    required this.illName,
    required this.type,
    required this.date, 
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryModel(
        docId: json['doctorId'],
        illName: json['illName'],
        type: json['type'],
        date: json['date'] as Timestamp, 
      );
}
