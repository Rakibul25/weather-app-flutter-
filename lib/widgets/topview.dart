

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/topdataview.dart';

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  List<Placemark> placemarksList = [];
  String city = "";
  double widthg = 0.0;
  String currentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String currentweekDate = DateFormat('EEEE').format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLaltitude().value,
        globalController.getLongtitude().value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    widthg = size.width;
    return Container(
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: widthg*.80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [TopDataView(title: city), TopDataView(title: "19°C")],
              ),
            ),
            Center(
              child: Container(
                child: Icon(Icons.cloud,size: 50,color: Colors.white60,),
              ),
            )
          ],
        ),
      ),
    );
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }
}
