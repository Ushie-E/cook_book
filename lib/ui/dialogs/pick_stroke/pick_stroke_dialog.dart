import 'package:cook_book/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PickStrokeDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PickStrokeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return ClipOval(
      child: AlertDialog(
        actions: [
          //Resetting to default stroke value
          ElevatedButton(
            child: const Icon(
              Icons.clear,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: strokeWidth));
              Navigator.pop;
            },
          ),
          ElevatedButton(
            child: const Icon(
              Icons.brush,
              size: 24,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: 10.0));
              Navigator.pop;
            },
          ),
          ElevatedButton(
            child: const Icon(
              Icons.brush,
              size: 40,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: 30.0));
              Navigator.pop;
            },
          ),
          ElevatedButton(
            child: const Icon(
              Icons.brush,
              size: 60,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: 50.0));
              Navigator.pop;
            },
          ),
        ],
      ),
    );
  }
}
