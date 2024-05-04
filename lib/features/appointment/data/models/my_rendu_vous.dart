import 'package:cloud_firestore/cloud_firestore.dart';

class RenduVousModel {
  final String doctorId;
  final String maladId;
  final int turn;
  final bool state;
  final DateTime dateTime;
  final String renduVousId;

  RenduVousModel(  
      {required this.renduVousId,
        required this.dateTime,
        required this.doctorId,
      required this.maladId,
      required this.turn,
      required this.state});

  factory RenduVousModel.fromJson(Map<String, dynamic> json,id) => RenduVousModel(
   
      dateTime: (json['Date'] as Timestamp).toDate(),
      doctorId: json['DoctorId'],
      maladId: json['MaladeId'],
      turn: json['Trun'],
      state: json['state'], renduVousId: id);

  Map<String, dynamic> toJson() =>
      {'DoctorId': doctorId, 'MaladeId': maladId, 'Trun': turn, 'state': state,'Date':dateTime};
}
