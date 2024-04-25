// ignore: file_names
class DoctorModel {
  final String fullName;
  final String speciality;
  final String wilaya;
  final String commune;
  final String email;
  final String gender;
  final String img;
  final String phoneNbr;
  final String about;
  final String id;

  DoctorModel(
      {
        required this.about, required this.id, 
        required this.fullName,
      required this.speciality,
      required this.wilaya,
      required this.commune,
      required this.email,
      required this.gender,
      required this.img,
      required this.phoneNbr});

  factory DoctorModel.fromJson(Map<String, dynamic> json, {required String id}) => DoctorModel(

    id:id,
      fullName: json['fullName'] as String,
      speciality: json['Speciality'] as String,
      wilaya: json['Wilaya'],
      commune: json['Commune'],
      email: json['email'],
      gender: json['Gender'],
      img: json['img'],
      phoneNbr: json['phone'], about: json['about']);



}
