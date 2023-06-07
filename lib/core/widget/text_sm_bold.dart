import 'package:flutter/material.dart';
import 'package:final_projem/core/const/fruits_const.dart';

class TextSmallMedium extends StatelessWidget {
  const TextSmallMedium({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? FruitConst.stop,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: FruitConst.colorblack, fontWeight: FontWeight.bold),
    );
  }
}
