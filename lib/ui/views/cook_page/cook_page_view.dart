import 'package:cook_book/ui/common/app_strings.dart';
import 'package:cook_book/ui/common/ui_helpers.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                TileCookBook(
                  onTap: viewModel.select,
                  titleName: kTitlePainterCookBook,
                  subTitleName: kSubTitlePainterCookBook,
                ),
                horizontalSpaceTiny,
                TileCookBook(
                  onTap: () {},
                  titleName: kTitlePDFCookBook,
                  subTitleName: kSubTitlePDFCookBook,
                ),
                horizontalSpaceTiny,
                TileCookBook(
                  onTap: () {},
                  titleName: kTitleThemeCookBook,
                  subTitleName: kSubTitleThemeCookBook,
                ),
                horizontalSpaceTiny,
                TileCookBook(
                  onTap: () {},
                  titleName: kTitleActionCookBook,
                  subTitleName: kSubTitleActionCookBook,
                ),
                horizontalSpaceTiny,
                TileCookBook(
                  onTap: () {},
                  titleName: kTitlePluginCookBook,
                  subTitleName: kSubTitlePluginCookBook,
                ),
                horizontalSpaceTiny,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CookPageViewModel viewModelBuilder(BuildContext context) =>
      CookPageViewModel();
}
