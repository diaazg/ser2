abstract class UserDataEvent {}

class GetUserData extends UserDataEvent {
  final String uid ;

  GetUserData({required this.uid});
}

class UpdateImage extends UserDataEvent {
  final String url ;

  UpdateImage({required this.url});

}