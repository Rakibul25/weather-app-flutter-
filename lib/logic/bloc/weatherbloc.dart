import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/logic/bloc/weatherevent.dart';
import 'package:weather/logic/bloc/weatherstate.dart';
import 'package:geolocator/geolocator.dart';
import '../../private_data/fetchweather.dart';

class WeatherBloc extends Bloc<weatherEvent, weatherState> {
  WeatherBloc() : super(InitialSate()) {
    getLocation();

    on<HomeCall>((event, emit) => {});
  }

  FetchWeather fetchWeather = FetchWeather();

  void fetcWithCor() async {}

  void getLocation() async {
    double laltitude = 0.0;
    double longitude = 0.0;
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
        .then((value) async {
      laltitude = value.latitude;
      longitude = value.longitude;
      WeatherInfo weatherInfo = await fetchWeather.getWeatherWithCor(laltitude, longitude);
      emit(ResultLoadedState(weatherInfo));
      print(weatherInfo.coord.lat);
    });
  }
}
