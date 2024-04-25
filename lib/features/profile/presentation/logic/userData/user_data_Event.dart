abstract class UserDataEvent {}

class GetUserData extends UserDataEvent {
  final String uid ;

  GetUserData({required this.uid});
}