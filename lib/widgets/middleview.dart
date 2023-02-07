import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/models/weather_info.dart';

class MiddleView extends StatefulWidget {
  const MiddleView({Key? key}) : super(key: key);

  @override
  State<MiddleView> createState() => _MiddleViewState();
}

class _MiddleViewState extends State<MiddleView> {
  List<WeatherInfo> weatherdata = [];
  final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=23.800322&lon=90.429306&appid=ce1c380d53098d84afba49d96200b5cb&units=metric&fbclid=IwAR2FcySmETLtyhMwpk06BwMM_yPwIWTPaX1Rph_Yngx6dRDuoAbHdnjK8HU');
  String a ='';
  Future<void> fetchUsers() async {
    http.Response response = await http.get(uri);
    final decode = await json.decode(response.body)!;
    String data = decode.toString();
    WeatherInfo weatherInfo = welcomeFromJson(data);
    //print(weatherInfo.visibility);
    a = weatherInfo.visibility.toString();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      this.fetchUsers();
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(a),
    );
  }
}
