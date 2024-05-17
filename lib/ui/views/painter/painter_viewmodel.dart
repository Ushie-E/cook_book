// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';
import 'package:cook_book/app/app.dialogs.dart';
import 'package:cook_book/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PainterViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  List<TouchPoints> get points => [];

  void start(DragStartDetails details) {}

  void update(DragUpdateDetails details) {}

  void end(DragEndDetails details) {}

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    rebuildUi();
  }

  void opacity() {
    _dialogService.showCustomDialog(
      variant: DialogType.opacity,
    );
  }

  void pickingRed() {}

  void pickingGreen() {}

  void pickingPink() {}

  void pickingBlue() {}

  void stroke() {
    _dialogService.showCustomDialog(
      variant: DialogType.pickStroke,
    );
  }
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
