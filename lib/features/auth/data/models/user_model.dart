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

class UserModelReg extends UserModel {
  final String userName;
  final String fullName;
  final String dateOfBirth;
  final double weight;
  final double height;
  final String country;
  final String city;
  final String town;
  late String? uid;

  UserModelReg(
      {required this.fullName,
      required this.dateOfBirth,
      required this.weight,
      required this.height,
      required this.country,
      required this.city,
      required this.town,
      required super.email,
      required super.password,
      required this.userName,
      this.uid});

  factory UserModelReg.fromJson(Map<String, dynamic> json) => UserModelReg(
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      weight: json['weight'] as double,
      height: json['height'] as double,
      country: json['country'] as String,
      city: json['city'] as String,
      town: json['town'] as String,
      userName: json['userName'] as String);

  Map<String, dynamic> toJson() => {
        'uid':uid,
        'email': email,
        'password': password,
        'userName': userName,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'weight': weight,
        'height': height,
        'country': country,
        'town': town,
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
        country,
        town
      ];
}
