// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';

import 'package:cook_book/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cook_page_viewmodel.dart';

class CookPageView extends StackedView<CookPageViewModel> {
  const CookPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CookPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        onPanStart: (details) {},
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
        backgroundColor: Colors.blue,
        child: const Icon(Icons.list_rounded),
        onPressed: () {},
      ),
    );
  }

  @override
  CookPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CookPageViewModel();
}
