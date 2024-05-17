import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'opacity_dialog_model.dart';

class OpacityDialog extends StackedView<OpacityDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const OpacityDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OpacityDialogModel viewModel,
    Widget? child,
  ) {
    return const ClipOval(
      child: AlertDialog(
        actions: [],
      ),
    );
  }

  @override
  OpacityDialogModel viewModelBuilder(BuildContext context) =>
      OpacityDialogModel();
}
