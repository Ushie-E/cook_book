import 'package:cook_book/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'painter_viewmodel.dart';

class PainterView extends StackedView<PainterViewModel> {
  const PainterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PainterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        onPanStart: viewModel.start,
        onPanUpdate: viewModel.update,
        onPanEnd: viewModel.end,
        child: Stack(
          children: [
            Center(
              child: Assets.images.shotHut.image(),
            ),
            CustomPaint(
              size: Size.infinite,
              painter: MyPainter(
                pointsList: viewModel.points,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Expand',
        backgroundColor: Colors.blue,
        onPressed: viewModel.toggleExpand,
        child: Icon(viewModel.isExpanded ? Icons.close : Icons.add),
      ),
    );
  }

  @override
  PainterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PainterViewModel();
}
