import 'package:geolocator/geolocator.dart';

class Location {

  late double latitude = 0;
  late double longitude = 0;

  getLocation() async {
    Position position;

    try {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

}