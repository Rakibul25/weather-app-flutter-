import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/mainweather.dart';
import 'package:weather/private_data/fetchweather.dart';
import 'package:weather/widgets/WeatherCard.dart';
import 'package:weather/widgets/topdataview.dart';

import '../models/weatherInfo.dart';

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  List<Placemark> placemarksList = [];
  String city = "";
  String temperature = "";
  String feelslike = "";
  String icon = "";
  String pressure = "";
  String humidity = "";
  String speed = "";
  String clouds = "";
  String details = "";
  String visibility = "";
  String country = "";
  double widthg = 0.0;
  String currentDate = DateFormat('yMMMMd').format(DateTime.now());
  String currentweekDate = DateFormat('EEEE').format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  WeatherInfo? weatherInfo;
  FetchWeather fetchWeather = FetchWeather();
  var data;

  @override
  void initState() {
    getdata(globalController.getLaltitude().value,
        globalController.getLongtitude().value);
    getAddress(globalController.getLaltitude().value,
        globalController.getLongtitude().value);
    //print(mainWeather?.temp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    widthg = size.width;
    return Obx(() => globalController.checkLoading().isTrue
        ? const Center(child: CircularProgressIndicator())
        : Container(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentDate.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          currentweekDate.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TopDataView(
                        title: city,
                        temp: temperature.toString() + "°C",
                        icon: icon,
                        details: details,
                        country: country),
                    SizedBox(
                      height: 30,
                    ),
                    WeatherCard(
                      feelslike: feelslike,
                      pressure: pressure,
                      humidity: humidity,
                      speed: speed,
                      clouds: clouds,
                      icon: icon,
                      details: details,
                      visibility: visibility,
                    )
                  ],
                ),
              ),
            ),
          ));
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    //print(lat);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

//fetching data
  void getdata(lat, lan) async {
    weatherInfo = await fetchWeather.processdata(lat, lan);
    setState(() {
      temperature = (weatherInfo?.main?.temp?.round()).toString();
      feelslike = (weatherInfo?.main?.feelsLike?.round()).toString();
      icon = (weatherInfo?.weather![0]?.icon).toString();
      details = (weatherInfo?.weather![0]?.description).toString();
      pressure = (weatherInfo?.main?.pressure).toString();
      humidity = (weatherInfo?.main?.humidity?.round()).toString();
      speed = (weatherInfo?.wind?.speed).toString();
      clouds = (weatherInfo?.clouds?.all).toString();
      visibility = (weatherInfo?.visibility).toString();
      country = (weatherInfo?.sys?.country).toString();
    });

  }
}
