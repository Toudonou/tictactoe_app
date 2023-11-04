// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

class Constant {
  static Color boardColor = const Color(0xFF24454B);
  static Color bgColor1 = const Color(0xFF70C5D4);
  static Color bgColor2 = const Color(0xFF70C5D4).withOpacity(0.5);

  static double defaultPadding = 10;

  static int ai = 1;
  static int human = -1;
}

class XPainter extends CustomPainter {
  final double percent;

  XPainter(this.percent);
  @override
  void paint(Canvas canvas, Size size) {
    var length = min(size.width, size.height);

    var paint1 = Paint()
      ..color = Color(0xFF24454B)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.23333 * length;

    var paint2 = Paint()
      ..color = Color(0xFF50AABA)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.16666 * length;

    var paint0 = Paint()
      ..color = Color(0xFFB1E2EF)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.05555 * length;

    canvas.drawLine(Offset.zero, Offset(length, length) * percent, paint1);
    canvas.drawLine(Offset(length, 0) + Offset(-length, length) * percent,
        Offset(length, 0), paint1);

    canvas.drawLine(Offset.zero, Offset(length, length) * percent, paint2);
    canvas.drawLine(Offset(length, 0) + Offset(-length, length) * percent,
        Offset(length, 0), paint2);

    canvas.drawLine(
      Offset(length, length) * percent -
          Offset(length, length) * (0.4 * 0.009 * length) * percent,
      Offset(length, length) * percent,
      paint0,
    );
    canvas.drawLine(
      Offset(length, 0) +
          Offset(-length, length) * (0.4 * 0.009 * length) * percent,
      Offset(length, 0),
      paint0,
    );
  }

  @override
  bool shouldRepaint(XPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(XPainter oldDelegate) => false;
}

class OPainter extends CustomPainter {
  final double percent;

  OPainter(this.percent);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = min(size.width, size.height) / 2;
    var center = Offset(size.width, size.height) / 2;
    var paint3 = Paint()
      ..color = Color(0xFF24454B)
      ..strokeWidth = 0.08547 * radius
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius + 0.1709 * radius),
      -pi / 2 - 50,
      2 * pi * percent,
      false,
      paint3,
    );

    var paint2 = Paint()
      ..color = Color(0xFF50AABA)
      ..strokeWidth = 0.3205 * radius
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 0.02136 * radius),
      -pi / 2 - 50,
      2 * pi * percent,
      false,
      paint2,
    );

    var paint1 = Paint()
      ..color = Color(0xFF24454B)
      ..strokeWidth = 0.08547 * radius
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 0.2136 * radius),
      -pi / 2 - 50,
      2 * pi * percent,
      false,
      paint1,
    );

    var paint0 = Paint()
      ..color = Color(0xFFB1E2EF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.1068 * radius
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 0.0641 * radius),
      -pi / 2 - 50,
      2 * pi * 0.15 * percent,
      false,
      paint0,
    );
  }

  @override
  bool shouldRepaint(OPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(OPainter oldDelegate) => false;
}
