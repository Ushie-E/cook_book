import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'pick_stroke_dialog_model.dart';

class PickStrokeDialog extends StackedView<PickStrokeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PickStrokeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PickStrokeDialogModel viewModel,
    Widget? child,
  ) {
    return const ClipOval(
      child: AlertDialog(
        actions: [],
      ),
    );
  }

  @override
  PickStrokeDialogModel viewModelBuilder(BuildContext context) =>
      PickStrokeDialogModel();
}
