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
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  CookPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CookPageViewModel();
}
