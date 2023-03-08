import 'package:flutter/material.dart';
import 'package:weather/private_data/fetchweather.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchWeather fetchWeather = FetchWeather();
  @override
  void initState() {
    // TODO: implement initState
    fetchWeather.getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("heloo "),
      ),
    );
  }
}
