import 'package:cook_book/gen/assets.gen.dart';
import 'package:cook_book/ui/views/painter/component/list_fab.dart';
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
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "paint_stroke",
            tooltip: 'Stroke',
            onPressed: () {}, // fabOptions.pickStroke,
            child: const Icon(Icons.brush),
          ),
          FloatingActionButton(
            heroTag: "paint_opacity",
            tooltip: 'Opacity',
            onPressed: () {}, // fabOptions.opacity,
            child: const Icon(Icons.opacity),
          ),
          FloatingActionButton(
            heroTag: "erase",
            tooltip: "Erase",
            onPressed: () {}, // fabOptions.erase,
            child: const Icon(Icons.clear),
          ),
          for (var item in viewModel.fabOptions.colorItems)
            FloatingActionButton(
              heroTag: item.heroTag,
              backgroundColor: Colors.white,
              tooltip: item.tooltip,
              onPressed: item.onPressed,
              child: ColorMenuItem(model: item),
            ),
        ],
      ),
    );
  }

  @override
  PainterViewModel viewModelBuilder(BuildContext context) => PainterViewModel();
}
