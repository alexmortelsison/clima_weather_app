import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }
}
