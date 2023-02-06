import 'package:flutter/material.dart';

class TopDataView extends StatelessWidget {
  final String title;

  TopDataView({required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*.40,
      child: Card(
        color: Colors.white24,
        elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
