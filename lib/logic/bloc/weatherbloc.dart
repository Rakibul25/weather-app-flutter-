import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/logic/bloc/weatherevent.dart';
import 'package:weather/logic/bloc/weatherstate.dart';
import 'package:geolocator/geolocator.dart';
import '../../private_data/fetchweather.dart';
import 'package:geocoding/geocoding.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WeatherBloc extends Bloc<weatherEvent, weatherState> {
  WeatherBloc() : super(InitialSate()) {
    getLocation();

    on<locatePressed>((event, emit) => {
      emit(ResultLoadingState()),
      Future.delayed(Duration(microseconds: 10)).then((value) => {
        getLocation()
      })
    });
    on<SearchIconPressed>((event, emit) => {
      if (event.query.isEmpty)
        {emit(NoResultState("empty"))}
      else
        {
          emit(ResultLoadingState()),
          Future.delayed(Duration(milliseconds: 10)).then((value) => {
            getweatherwithquery(event.query)
          })
        }
    });
  }

  FetchWeather fetchWeather = FetchWeather();

  void getweatherwithquery(String query) async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      try{
        WeatherInfo weatherInfo =
        await fetchWeather.getWeatherWithquery(query);
        emit(ResultLoadedStateWithquery(weatherInfo));
      } catch(ex){
        emit(Notmatched());
      }
    }else{
      emit(NoInternet());
    }

  }
  void getLocation() async {
    double laltitude = 0.0;
    double longitude = 0.0;
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      if (!isServiceEnabled) {
        //return Future.error("Location is not enabled");
        emit(LocationNotEnabled());
      }

      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.deniedForever) {
        //return Future.error("Permission denied forever");
        emit(LocationNotEnabled());
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

        List<Placemark> placemarks = await placemarkFromCoordinates(laltitude, longitude);
        //print(lat);
        Placemark place = placemarks[0];
        try{
          WeatherInfo weatherInfo =
          await fetchWeather.getWeatherWithCor(laltitude, longitude);
          emit(ResultLoadedStateWithcordinate(weatherInfo,place));
        } catch(ex){
          emit(NoResultState(ex.toString()));
        }
      });
    } else {
      emit(NoInternet());
    }
  }
}
