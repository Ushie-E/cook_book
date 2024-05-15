import 'package:flutter/material.dart';

class ColorMenuItemModel {
  final String heroTag;
  final String tooltip;
  final Color color;
  final VoidCallback onPressed;

  ColorMenuItemModel({
    required this.heroTag,
    required this.tooltip,
    required this.color,
    required this.onPressed,
  });
}

class FABOptionModel {
  final List<ColorMenuItemModel> colorItems;
  final VoidCallback pickStroke;
  final VoidCallback opacity;
  final VoidCallback erase;

  FABOptionModel({
    required this.colorItems,
    required this.pickStroke,
    required this.opacity,
    required this.erase,
  });
}

class ColorMenuItem extends StatefulWidget {
  final ColorMenuItemModel model;

  const ColorMenuItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _ColorMenuItemState createState() => _ColorMenuItemState();
}

class _ColorMenuItemState extends State<ColorMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.model.onPressed();
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          color: widget.model.color,
        ),
      ),
    );
  }
}
