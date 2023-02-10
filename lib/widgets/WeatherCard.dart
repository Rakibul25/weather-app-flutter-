import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String feelslike;
  final String pressure;
  final String humidity;
  final String speed;
  final String clouds;
  final String icon;
  final String details;
  final String visibility;

  const WeatherCard({
    super.key,
    required this.feelslike,
    required this.pressure,
    required this.humidity,
    required this.speed,
    required this.clouds,
    required this.icon,
    required this.details,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //this is the main weather details box
      height: size.height * .45,
      width: size.width * .80,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 5),
        child: Row(
          //this row for contain all three data column
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              //icon column
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icon/feelslike.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/icon/windspeed.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/icon/humidity.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/icon/visible.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/icon/windpressure.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/icon/clouds.png',
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            Column(
              //text column
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Feels Like ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
                Text("Wind Speed ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
                Text("Humidity ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
                Text("Visibility ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
                Text("Air Pressure ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
                Text("Clouds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal)),
              ],
            ),
            Column(
              //data column
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$feelslike°C",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "$speed km/h",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "$humidity %",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "$visibility km",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "$pressure hpa",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "$clouds %",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
