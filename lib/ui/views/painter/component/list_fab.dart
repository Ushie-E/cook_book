import 'package:cook_book/ui/views/painter/painter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

class FloatingActionOption extends ViewModelWidget<PainterViewModel> {
  const FloatingActionOption({
    super.key,
  });

  @override
  Widget build(BuildContext context, PainterViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //FAB for choosing stroke
        FloatingActionButton(
          onPressed: viewModel.stroke,
          heroTag: "paint_stroke",
          tooltip: 'Stroke',
          child: const Icon(Icons.brush),
        ),
        const Gap(7),
        //FAB for choosing opacity
        FloatingActionButton(
          onPressed: viewModel.opacity,
          heroTag: "paint_opacity",
          tooltip: 'Opacity',
          child: const Icon(Icons.opacity),
        ),
        //FAB for resetting screen
        const Gap(7),
        FloatingActionButton(
          onPressed: viewModel.toggleVisibility,
          heroTag: "erase",
          tooltip: "Erase",
          child: const Icon(Icons.clear),
        ),
        //FAB for picking red color
        const Gap(7),
        FloatingActionButton(
          onPressed: viewModel.pickingRed,
          backgroundColor: Colors.white,
          heroTag: "color_red",
          tooltip: 'Color',
          child: ColorMenuItem(
            color: Colors.red,
            onPressed: () {},
          ),
        ),
        const Gap(7),
        //FAB for picking green color
        FloatingActionButton(
          onPressed: viewModel.pickingGreen,
          backgroundColor: Colors.white,
          heroTag: "color_green",
          tooltip: 'Color',
          child: ColorMenuItem(
            color: Colors.green,
            onPressed: () {},
          ),
        ),
        //FAB for picking pink color
        const Gap(7),
        FloatingActionButton(
          backgroundColor: Colors.white,
          heroTag: "color_pink",
          tooltip: 'Color',
          onPressed: viewModel.pickingPink,
          child: ColorMenuItem(
            color: Colors.pink,
            onPressed: () {},
          ),
        ),
        //FAB for picking blue color
        const Gap(7),
        FloatingActionButton(
          backgroundColor: Colors.white,
          heroTag: "color_blue",
          tooltip: 'Color',
          onPressed: viewModel.pickingBlue,
          child: ColorMenuItem(
            color: Colors.blue,
            onPressed: () {},
          ),
        ),
        const Gap(7),
        FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: viewModel.toggleVisibility,
          heroTag: "erase",
          tooltip: "Erase",
          child: const Icon(Icons.clear),
        ),
      ],
    );
  }
}

class ColorMenuItem extends StatefulWidget {
  final Color? color;
  final Function()? onPressed;

  const ColorMenuItem({
    Key? key,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  ColorMenuItemState createState() => ColorMenuItemState();
}

class ColorMenuItemState extends State<ColorMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onPressed;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          color: widget.color,
        ),
      ),
    );
  }
}
