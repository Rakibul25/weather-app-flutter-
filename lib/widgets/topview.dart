import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/mainweather.dart';
import 'package:weather/private_data/fetchweather.dart';
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        currentDate.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        currentweekDate.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(child: Image.asset('assets/icon/snow.png',height: 50,width: size.width*.80,)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: widthg * .80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopDataView(title: city),
                        TopDataView(title: temperature.toString() + "°C")
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                    ],
                  )
                ],

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
    });
    //print(weatherInfo?.main?.temp);
  }
}
