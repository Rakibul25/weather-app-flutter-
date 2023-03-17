import 'dart:math' as math;
import 'package:flutter/material.dart';

class HalfCircleProgressBar extends StatelessWidget {
  final double progressValue;

  HalfCircleProgressBar({required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: progressValue),
      duration: Duration(milliseconds: 1000),
      builder: (_, value, child) {
        return CustomPaint(
          painter: HalfCirclePainter(value),
          child: child,
        );
      },
      child: Container(),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double progressValue;

  HalfCirclePainter(this.progressValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundLine = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Paint foregroundLine = Paint()
      ..color = Colors.orangeAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double angle = math.pi / 1;
    double progressAngle = angle * progressValue;

    Offset center = Offset(size.width / 2, size.height/2);
    double radius = size.width / 2;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        angle,
        angle,
        false,
        backgroundLine);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        angle,
        progressAngle,
        false,
        foregroundLine);
  }

  @override
  bool shouldRepaint(HalfCirclePainter oldDelegate) =>
      oldDelegate.progressValue != progressValue;
}
