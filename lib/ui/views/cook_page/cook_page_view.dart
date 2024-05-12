import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        title: const Text("Cook Book"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: viewModel.select,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                  padding: const EdgeInsets.all(6),
                  child: const Text("Painter"),
                ),
              )
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
