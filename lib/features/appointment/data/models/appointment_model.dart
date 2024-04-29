class AppointmentModel {
  final String evStart;
  final String evEnd;
  final String mrStart;
  final String mrEnd;
  final int nbr;
  final String time;
  final String day ;

  AppointmentModel( 
      {required this.day,
        required this.evStart,
      required this.evEnd,
      required this.mrStart,
      required this.mrEnd,
      required this.nbr,
      required this.time});

  factory AppointmentModel.fromJson(Map<String,dynamic>json,String day) => AppointmentModel(
      day : day,
      evStart: json['Ev1'] ,
      evEnd: json['Ev2'] ,
      mrStart: json['Mr1'] ,
      mrEnd: json['Mr2'] ,
      nbr: json['Nb'] ,
      time: json['Time'] );

      
}
