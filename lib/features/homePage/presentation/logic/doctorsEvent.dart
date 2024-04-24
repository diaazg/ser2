abstract class NearbyDoctorsEvent {}



class GetNearbyDoctorsEvent extends NearbyDoctorsEvent {
  final String wilaya;

  GetNearbyDoctorsEvent({required this.wilaya});
}

