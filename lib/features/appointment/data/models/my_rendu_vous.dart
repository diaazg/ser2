import 'package:cloud_firestore/cloud_firestore.dart';

class RenduVousModel {
  final String doctorId;
  final String maladId;
  final int turn;
  final bool state;
  final DateTime dateTime;

  RenduVousModel( 
      {
        required this.dateTime,
        required this.doctorId,
      required this.maladId,
      required this.turn,
      required this.state});

  factory RenduVousModel.fromJson(Map<String, dynamic> json) => RenduVousModel(
      dateTime: (json['dateOfBirth'] as Timestamp).toDate(),
      doctorId: json['DoctorId'],
      maladId: json['MaladeId'],
      turn: json['Trun'],
      state: json['state']);

  Map<String, dynamic> toJson() =>
      {'DoctorId': doctorId, 'MaladeId': maladId, 'Trun': turn, 'state': state,'Date':dateTime};
}
