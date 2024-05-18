import 'package:cook_book/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class OpacityDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const OpacityDialog({
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
          ElevatedButton(
            child: const Icon(
              Icons.opacity,
              size: 24,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: opacities));
              Navigator.pop;
            },
          ),
          ElevatedButton(
            child: const Icon(
              Icons.opacity,
              size: 40,
            ),
            onPressed: () async {
              completer(DialogResponse(confirmed: true, data: 0.5));
              Navigator.pop;
            },
          ),
          ElevatedButton(
            child: const Icon(
              Icons.opacity,
              size: 60,
            ),
            onPressed: () async {
              //not transparent at all.
              completer(DialogResponse(confirmed: true, data: 1.0));
              Navigator.pop;
            },
          ),
        ],
      ),
    );
  }
}
