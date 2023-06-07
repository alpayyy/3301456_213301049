import 'package:flutter/material.dart';
import 'package:final_projem/core/const/fruits_const.dart';

class TextSmall extends StatelessWidget {
  const TextSmall({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text ?? FruitConst.stop,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: FruitConst.colorgrey),
    );
  }
}
