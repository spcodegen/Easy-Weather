import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationService {
  Future<String> getCityNameFormCurrentLocation() async {
    //get the permisiion from the user to access the location
    LocationPermission permisiion = await Geolocator.requestPermission();
    if (permisiion == LocationPermission.denied) {
      permisiion = await Geolocator.requestPermission();
    }

    //get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(position.latitude);
    print(position.longitude);

    //conver the location in to list of place marks
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //extract the city name from the place marks
    String cityName = placeMarks[0].locality!;
    print(cityName);

    return cityName;
  }
}
