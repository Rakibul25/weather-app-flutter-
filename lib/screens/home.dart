import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/mainweather.dart';
import 'package:weather/private_data/fetchweather.dart';
import 'package:weather/widgets/topdataview.dart';
import 'package:lottie/lottie.dart';
import '../models/weatherInfo.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
                child: Obx(() => globalController.checkLoading().isTrue
                    ? Center(
                        child: Center(
                        child: Lottie.asset("assets/lotties/splash.json")
                      ))
                    : Column(
                        children: const [
                          TopView(),
                        ],
                      ))),
          ],
        ));
  }
}
