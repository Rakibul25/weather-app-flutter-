import 'package:geocoding/geocoding.dart';
//defining state for BLoC
import 'package:weather/data/models/weather.dart';

abstract class weatherState {}
//initial
class InitialSate extends weatherState {}

//loading state
class ResultLoadingState extends weatherState {}
//result loaded state
class ResultLoadedStateWithcordinate extends weatherState {
  final WeatherInfo weatherInfo;
  final Placemark placemark;
  ResultLoadedStateWithcordinate(this.weatherInfo,this.placemark);
}
class ResultLoadedStateWithquery extends weatherState {
  final WeatherInfo weatherInfo;
  ResultLoadedStateWithquery(this.weatherInfo);
}
//no result state
class NoResultState extends weatherState {
  final String error;
  NoResultState(this.error);
}
class NoInternet extends weatherState {}
class LocationNotEnabled extends weatherState {}
class Notmatched extends weatherState {}
