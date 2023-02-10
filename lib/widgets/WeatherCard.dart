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
      alignment: Alignment.topLeft,
      height: size.height * .45,
      width: size.width * .80,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Image.asset(
                  'assets/icon/feelslike.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Feels Like ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  "$feelslike°C",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/windspeed.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Wind Speed ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  "$speed km/h",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/humidity.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Humidity ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  "$humidity %",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/visible.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Visibility ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  "${visibility} m",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/windpressure.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Air Pressure ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),

                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  "${pressure} hpa",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/clouds.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                const Text("Clouds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  width: size.width * .05,
                ),

                Text(
                  "${clouds} %",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
