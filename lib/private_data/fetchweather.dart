//©Rakibul Islam
import 'package:dio/dio.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/private_data/private.dart';

import 'API.dart';

class FetchWeather {
  API api = API();

  //this function to fetch for initial blocs page
  Future<WeatherInfo> getWeatherWithCor(double lat, double lon) async {
    try {
      //trying to fetch blocs result with blocs keyword
      Response response = await api.sendRequest.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$Apikey&units=metric&fbclid=IwAR03H7NMdCtc5AscJEjcalAuesRR-GYDZZrpN1i5E-byKYIxemaPmw7colM");
      var data = response.data;
      return WeatherInfo.fromJson(data);
      //saving instance in data and parsing in productmodel and then return
      //return WeatherInfo.fromJson(data);
    } catch (ex) {
      throw ex;
    }
  }
}
