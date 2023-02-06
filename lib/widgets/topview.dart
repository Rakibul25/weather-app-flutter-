import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/globalcontroller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  List<Placemark> placemarksList = [];
  String city = "";
  String country = "";
  String sub = "";
  String street1 = "";
  String street2 = "";
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  @override
  void initState() {
    getAddress(globalController.getLaltitude().value,globalController.getLongtitude().value);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    city = placemarksList[0].locality.toString();
    sub = placemarksList[0].subLocality.toString();
    street1 = placemarksList[3].street.toString();
    street2 = placemarksList[2].street.toString();
    country = placemarksList[0].country.toString();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(city, style: TextStyle(fontSize: 40),),
            Text(sub, style: TextStyle(fontSize: 30),),
            Text(street1, style: TextStyle(fontSize: 30),),
            Text(street2, style: TextStyle(fontSize: 30),),
            Text(country, style: TextStyle(fontSize: 30),),

          ],
        ),
      )
    );
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    //Placemark place = placemarks[0];
    setState(() {
      placemarksList = placemarks;
    });
  }
}
