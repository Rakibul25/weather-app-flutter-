import 'package:flutter/material.dart';
class MiddleView extends StatelessWidget {
  final String? temp1;
  const MiddleView({Key? key, required this.temp1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(temp1!),
    );
  }
}
