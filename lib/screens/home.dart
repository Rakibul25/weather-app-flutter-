import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather/widgets/middleview.dart';
import 'package:http/http.dart' as http;
import '../models/weather_info.dart';
import '../private_data/fetch_weather.dart';
import '../private_data/private.dart';
import '../widgets/topview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  var lat,lon;
  var temp1;

  WeatherInfo? weatherInfo;

  FetchWeatherData fetchWeatherData = FetchWeatherData();

  Future<WeatherInfo?> fetchUsers(RxDouble lat1, RxDouble lon1) async {
    WeatherInfo? weatherInfo1;
    final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat1&lon=$lon1&appid=$Apikey&units=metric&fbclid=IwAR2FcySmETLtyhMwpk06BwMM_yPwIWTPaX1Rph_Yngx6dRDuoAbHdnjK8HU');
    http.Response response = await http.get(uri);
    final decode = await json.decode(response.body);
    var jsonString = jsonDecode(response.body);
    setState(() {
      weatherInfo1 = WeatherInfo.fromJson(jsonString);
      //temp1 = weatherInfo?.main.temp;
      print(weatherInfo?.main.temp);
      //temp1 =temp1.floor();

    });
    return weatherInfo1;
  }

  @override
  void initState() {
    // TODO: implement initState
    lat = globalController.getLaltitude();
    lon = globalController.getLongtitude();
    fetchUsers(lat, lon);
    super.initState();
    //this.fetchUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
        body: SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue
                ? const Center(child: LinearProgressIndicator())
                : Column(
              children: [
                TopView(),
                SizedBox(height: 10,),
                Container(height: 50, child: MiddleView(temp1: "temp1",))
              ],
            ))));
  }
}

