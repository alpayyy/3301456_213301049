import 'package:flutter/material.dart';
import 'package:final_projem/core/const/fruits_const.dart';

class TextMedium extends StatelessWidget {
  const TextMedium({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? FruitConst.stop,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: FruitConst.colorblack, fontWeight: FontWeight.bold),
    );
  }
}
