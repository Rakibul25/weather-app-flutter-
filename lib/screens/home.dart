import 'dart:convert';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather/models/weatherInfo.dart';
import 'package:weather/widgets/middleview.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../private_data/fetchweather.dart';
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
                      SizedBox(
                        height: 10,
                      ),
                      //Container(height: 50, child: MiddleView(temp1: "temp1",))
                    ],
                  ))));
  }


}
