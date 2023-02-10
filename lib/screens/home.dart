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
        backgroundColor: Colors.white30,
        body: Stack(
          children: [
            Image.asset('assets/icon/mycap.jpg',
                width: size.width, height: size.height, fit: BoxFit.cover),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: size.width,
                height: size.height,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            SafeArea(
                child: Obx(() => globalController.checkLoading().isTrue
                    ? Center(
                        child: Center(
                        child: CircularProgressIndicator()
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
