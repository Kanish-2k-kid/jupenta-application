import 'package:flutter/material.dart';
import 'dart:math';

class Speedometer extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final double minValue;
  final String unit;

  Speedometer({
    required this.currentValue,
    required this.maxValue,
    required this.minValue,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: SpeedometerPainter(
          currentValue: currentValue,
          maxValue: maxValue,
          minValue: minValue,
          unit: unit,
        ),
      ),
    );
  }
}

class SpeedometerPainter extends CustomPainter {
  final double currentValue;
  final double maxValue;
  final double minValue;
  final String unit;

  SpeedometerPainter({
    required this.currentValue,
    required this.maxValue,
    required this.minValue,
    required this.unit,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final Paint foregroundPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final Paint textPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..textAlign = TextAlign.center;

    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double startAngle = pi * 0.75; // Start angle for the gauge
    final double sweepAngle = pi * 1.5; // Sweep angle for the gauge

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - 10),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw foreground arc
    final double valuePercentage = (currentValue - minValue) / (maxValue - minValue);
    final double valueAngle = startAngle + (sweepAngle * valuePercentage);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - 10),
      startAngle,
      valueAngle - startAngle,
      false,
      foregroundPaint,
    );

    // Draw current value text
    final TextSpan textSpan = TextSpan(
      text: '${currentValue.toStringAsFixed(1)} $unit',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    textPainter.paint(canvas, Offset(centerX - textPainter.width / 2, centerY - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

extension on Paint {
  set textAlign(TextAlign textAlign) {}
}
