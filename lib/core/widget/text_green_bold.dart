import 'package:final_projem/core/const/fruits_const.dart';
import 'package:flutter/material.dart';

class TextGreen extends StatelessWidget {
  const TextGreen({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? FruitConst .stop,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
