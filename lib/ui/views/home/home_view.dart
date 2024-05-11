import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cook_book/ui/common/app_colors.dart';
import 'package:cook_book/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CookBookPage(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class CookBookPage extends StatefulWidget {
  const CookBookPage({super.key});

  @override
  State<CookBookPage> createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: MyPainter(
              pointsList: points,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({this.pointsList});

  //Keep track of the points tapped on the screen
  List<TouchPoints> pointsList;
  List<Offset> offsetPoints = List();

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));

        //Draw points when two points are not next to each other
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
// body: SafeArea(
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           verticalSpaceLarge,
//           Column(
//             children: [
//               const Text(
//                 'Hello, STACKED!',
//                 style: TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               verticalSpaceMedium,
//               MaterialButton(
//                 color: Colors.black,
//                 onPressed: viewModel.incrementCounter,
//                 child: Text(
//                   viewModel.counterLabel,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MaterialButton(
//                 color: kcDarkGreyColor,
//                 onPressed: viewModel.showDialog,
//                 child: const Text(
//                   'Show Dialog',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               MaterialButton(
//                 color: kcDarkGreyColor,
//                 onPressed: viewModel.showBottomSheet,
//                 child: const Text(
//                   'Show Bottom Sheet',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// ),
