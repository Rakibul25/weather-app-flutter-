import 'package:flutter/material.dart';
import 'package:weather/screens/home.dart';
import 'package:weather/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather',
      color: Colors.white30,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
