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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello"),
    );
  }
}
