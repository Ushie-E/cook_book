import 'package:cook_book/app/app.dialogs.dart';
import 'package:cook_book/app/app.locator.dart';
import 'package:cook_book/ui/common/ui_helpers.dart';
import 'package:cook_book/ui/views/painter/component/touch_point.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PainterViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  final List<TouchPoints> _points = [];
  List<TouchPoints> get points => _points;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    rebuildUi();
  }

  void start(DragStartDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    _points.add(
      TouchPoints(
        points: renderBox.globalToLocal(details.globalPosition),
        paint: Paint()
          ..strokeCap = strokeType
          ..isAntiAlias = true
          ..color = selectedColor.withOpacity(opacities)
          ..strokeWidth = strokeWidth,
      ),
    );
    rebuildUi();
  }

  void update(DragUpdateDetails details, BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    _points.add(
      TouchPoints(
        points: renderBox.globalToLocal(details.globalPosition),
        paint: Paint()
          ..strokeCap = strokeType
          ..isAntiAlias = true
          ..color = selectedColor.withOpacity(opacities)
          ..strokeWidth = strokeWidth,
      ),
    );
    rebuildUi();
  }

  void end(DragEndDetails details) {
    points.add;
    rebuildUi();
  }

  Future<void> opacity() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.opacity,
      barrierDismissible: true,
    );
    if (response != null && response.confirmed) {
      opacities = response.data;
      rebuildUi();
    }
  }

  Future<void> stroke() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.pickStroke,
      barrierDismissible: true,
    );

    if (response != null && response.confirmed) {
      strokeWidth = response.data;
      rebuildUi();
    }
  }

  void pickingRed() {
    selectedColor = Colors.red;
    rebuildUi();
  }

  void pickingGreen() {
    selectedColor = Colors.green;
    rebuildUi();
  }

  void pickingPink() {
    selectedColor = Colors.pink;
    rebuildUi();
  }

  void pickingBlue() {
    selectedColor = Colors.blue;
    rebuildUi();
  }

  void erase() {
    points.clear();
    rebuildUi();
  }
}
