import 'package:flutter/material.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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
                TopView()
              ],
            ))));
  }
}
