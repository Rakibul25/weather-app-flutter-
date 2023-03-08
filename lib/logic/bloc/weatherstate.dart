
//defining state for BLoC
import 'package:weather/data/models/weather.dart';

abstract class weatherState {}
//initial
class InitialSate extends weatherState {}

//loading state
class ResultLoadingState extends weatherState {}
//result loaded state
class ResultLoadedState extends weatherState {
  final WeatherInfo weatherInfo;
  ResultLoadedState(this.weatherInfo);
}
//no result state
class NoResultState extends weatherState {
  final String error;
  NoResultState(this.error);
}