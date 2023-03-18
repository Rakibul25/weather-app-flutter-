import 'package:flutter/material.dart';
class WeatherCard extends StatelessWidget {
  final String title;
  final String image;
  final String data;
  const WeatherCard({Key? key, required this.title, required this.image, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(fontSize: 15,color: Colors.white),),
          SizedBox(height: 5,),
          Text(data,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
