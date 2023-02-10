import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../private_data/fetchweather.dart';
class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _laltitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;

  RxDouble getLaltitude() => _laltitude;

  RxDouble getLongtitude() => _longitude;

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  void getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location is not enabled");
    }


    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Permission denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Permission denied");
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _laltitude.value = value.latitude;
      _longitude.value = value.longitude;

      _isLoading.value = false;
    });
  }
}
