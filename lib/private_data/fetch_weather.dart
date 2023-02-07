import 'dart:convert';

import 'package:weather/models/weather_info.dart';
import 'package:http/http.dart' as http;
import 'private.dart';

class FetchWeatherData{
  WeatherInfo? weatherInfo;

  Future<WeatherInfo?> processdata(lat,lon) async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherInfo = WeatherInfo.fromJson(jsonString);
    return weatherInfo!;
  }

}

String apiURL(var lat, var lon){
  String url;
  url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$Apikey&units=metric&fbclid=IwAR2FcySmETLtyhMwpk06BwMM_yPwIWTPaX1Rph_Yngx6dRDuoAbHdnjK8HU";
  return url;
}