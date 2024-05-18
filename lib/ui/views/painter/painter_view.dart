import 'package:cook_book/gen/assets.gen.dart';
import 'package:cook_book/ui/views/painter/component/list_fab.dart';
import 'package:cook_book/ui/views/painter/component/touch_point.dart';
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
          onPanStart: (details) => viewModel.start(details, context),
          onPanUpdate: (details) => viewModel.update(details, context),
          onPanEnd: viewModel.end,
          child: Stack(
            children: [
              Center(
                child: Assets.images.hut.image(),
              ),
              CustomPaint(
                size: Size.infinite,
                painter: MyPainter(
                  pointsList: viewModel.points,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!viewModel.isVisible)
              FloatingActionButton(
                onPressed: viewModel.toggleVisibility,
                backgroundColor: Colors.blue,
                child: const Icon(Icons.menu),
              ),
            if (viewModel.isVisible) const FloatingActionOption(),
          ],
        ));
  }

  @override
  PainterViewModel viewModelBuilder(BuildContext context) => PainterViewModel();
}
