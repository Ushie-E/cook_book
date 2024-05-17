import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleName!,
              style: const TextStyle(fontSize: 22),
            ),
            const Gap(16),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subTitleName!),
            const Gap(6),
            const Row(
              children: [
                Icon(Icons.video_collection_sharp),
                Gap(6),
                Icon(Icons.unfold_less_rounded)
              ],
            )
          ],
        ),
      ),
    );
  }
}
