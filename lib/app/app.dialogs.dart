// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/opacity/opacity_dialog.dart';
import '../ui/dialogs/pick_stroke/pick_stroke_dialog.dart';

enum DialogType {
  opacity,
  pickStroke,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.opacity: (context, request, completer) =>
        OpacityDialog(request: request, completer: completer),
    DialogType.pickStroke: (context, request, completer) =>
        PickStrokeDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
