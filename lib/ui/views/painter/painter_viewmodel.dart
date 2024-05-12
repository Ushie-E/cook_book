// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PainterViewModel extends BaseViewModel {
  List<TouchPoints> get points => [];

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpand() {
    _isExpanded = !_isExpanded;
  }

  void start(DragStartDetails details) {}

  void update(DragUpdateDetails details) {}

  void end(DragEndDetails details) {}
}

class TouchPoints {
  Paint paint;
  Offset points;
  TouchPoints({required this.points, required this.paint});
}

class MyPainter extends CustomPainter {
  MyPainter({required this.pointsList});

  List<TouchPoints> pointsList;
  List<Offset> offsetPoints = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));

        //Draw points when two points are not next to each other
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
