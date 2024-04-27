abstract class UserModel {
  final String? email;
  final String? password;

  const UserModel({this.email, this.password});
}

class UserModelLog extends UserModel {
  UserModelLog({super.email, super.password});

  factory UserModelLog.fromJson(Map<String, dynamic> json) => UserModelLog(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  List<Object?> get props => [email, password];
}

class UserModelInfo extends UserModel {
  final String userName;
  final String fullName;
  final String dateOfBirth;
  final double weight;
  final double height;
  final String city;
  final String town;
  final String gender;
  final String blood;
  late String? uid;
  late String? img;

  UserModelInfo(
      {
        required this.gender, required this.blood, 
        required this.fullName,
      required this.dateOfBirth,
      required this.weight,
      required this.height,
      required this.city,
      required this.town,
      required super.email,
      required super.password,
      required this.userName,
      this.uid,
      this.img});

  factory UserModelInfo.fromJson(Map<String, dynamic> json) => UserModelInfo(
      img:json['img'],
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      weight: json['weight'] as double,
      height: json['height'] as double,
      city: json['wilaya'] as String,
      town: json['commune'] as String,
      userName: json['userName'] as String, gender: json['gender'] as String, blood: json['blood'] as String);

  Map<String, dynamic> toJson() => {
        'img':'',
        'uid':uid,
        'email': email,
        'password': password,
        'userName': userName,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'weight': weight,
        'height': height,
        'commune':town,
        'wilaya':city,
        'blood':blood,
        'gender':gender
      };

  List<Object?> get props => [
        uid,
        email,
        password,
        userName,
        fullName,
        dateOfBirth,
        weight,
        height,
       
        town
      ];
}
