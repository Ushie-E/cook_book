import 'package:flutter/material.dart';

class TileCookBook extends StatelessWidget {
  const TileCookBook({
    Key? key,
    this.onTap,
    this.titleName,
    this.subTitleName,
  }) : super(key: key);

  final Function()? onTap;
  final String? titleName;
  final String? subTitleName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(titleName!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subTitleName!),
            const Row(
              children: [
                Icon(Icons.video_collection_sharp),
                Icon(Icons.unfold_less_rounded)
              ],
            )
          ],
        ),
      ),
    );
  }
}
