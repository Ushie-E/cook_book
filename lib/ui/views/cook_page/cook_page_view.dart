import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'component/tile_cook_book.dart';
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
      appBar: AppBar(
        title: const Text("Cook Book"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              TileCookBook(
                onTap: viewModel.select,
                titleName: "Painter Canvas",
                subTitleName: "Drawing and Painting using CustomPainter",
              ),
              TileCookBook(
                onTap: () {},
                titleName: "Loading PDF",
                subTitleName: "Loading PDF file from Firebase Storage",
              ),
              TileCookBook(
                onTap: () {},
                titleName: "Theme Caching (Moor)",
                subTitleName: "Save Current Theme in Local database",
              ),
              TileCookBook(
                onTap: () {},
                titleName: "Theme in Action",
                subTitleName: "Toggle between Light & Dark themes",
              ),
              TileCookBook(
                onTap: () {},
                titleName: "Text-To-Speech Plugin",
                subTitleName:
                    "Code recipe to demonstrate usage of it Flutter Plugin",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CookPageViewModel viewModelBuilder(BuildContext context) =>
      CookPageViewModel();
}
