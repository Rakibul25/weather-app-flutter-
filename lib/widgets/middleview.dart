import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/private_data/fetch_weather.dart';
import 'dart:convert';
import 'package:weather/private_data/private.dart';
import 'package:get/get.dart';
import 'package:weather/models/weather_info.dart';
import '../globalcontroller/global_controller.dart';
import 'package:weather/private_data/private.dart';

class MiddleView extends StatefulWidget {
  const MiddleView({Key? key}) : super(key: key);

  @override
  State<MiddleView> createState() => _MiddleViewState();
}

class _MiddleViewState extends State<MiddleView> {
  var temp1;
  late final RxDouble lat,lon;
  WeatherInfo? weatherInfo;
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  FetchWeatherData fetchWeatherData = FetchWeatherData();

  Future<void> fetchUsers() async {
    lat = globalController.getLaltitude();
    lon = globalController.getLongtitude();
    final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$Apikey&units=metric&fbclid=IwAR2FcySmETLtyhMwpk06BwMM_yPwIWTPaX1Rph_Yngx6dRDuoAbHdnjK8HU');
    http.Response response = await http.get(uri);
    final decode = await json.decode(response.body);
    var jsonString = jsonDecode(response.body);
    setState(() {
      weatherInfo = WeatherInfo.fromJson(jsonString);
      temp1 = weatherInfo?.main.temp!;
      print(weatherInfo?.main.temp);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
    //this.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: temp1.toString()!="null"?Text(temp1.toString()) : SizedBox(height: 5,),
    );
  }
}
