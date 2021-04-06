import 'package:geolocator/geolocator.dart';

class LocationHelper {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
     Geolocator.getCurrentPosition().then((Position position) {                                      // call fn
      latitude=position.latitude;
      longitude=position.longitude;
    }).catchError((e) {
      print(e);
    });
  }
}
