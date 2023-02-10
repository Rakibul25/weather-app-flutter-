import 'package:weather/models/weatherInfo.dart';
import 'package:weather/private_data/private.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:weather/models/mainweather.dart';

import '../globalcontroller/global_controller.dart';

class FetchWeather {
  WeatherInfo? weatherInfo;
  MainWeather? mainWeather;
  List<MainWeather>? list;

  Future<WeatherInfo?> processdata(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    if (response.statusCode == 200) {
      print("Success");
      var jsonString = jsonDecode(response.body);
      weatherInfo = WeatherInfo.fromJson(jsonString);
    } else {
      print("failed");
    }
    return weatherInfo;

  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$Apikey&units=metric&fbclid=IwAR2FcySmETLtyhMwpk06BwMM_yPwIWTPaX1Rph_Yngx6dRDuoAbHdnjK8HU";
  return url;
}
