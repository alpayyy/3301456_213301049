import 'package:flutter/material.dart';

import '../../core/const/fruits_const.dart';
import '../../core/widget/text_green_bold.dart';
import '../../core/widget/text_medium_bold.dart';
import '../../core/widget/text_sm_bold.dart';
import '../../core/widget/text_small_bold.dart';
import '../detail/fruits_brocoli.dart';
import '../detail/fruits_cabbage.dart';
import '../detail/fruits_potato.dart';
import '../detail/fruits_tomatoes.dart';


class FruitsHome extends StatefulWidget {
  const FruitsHome({super.key});

  @override
  State<FruitsHome> createState() => _FruitsHomeState();
}

class _FruitsHomeState extends State<FruitsHome> {
  int selectedPageIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.paste,
    Icons.bookmark_border,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _rowAppbar(context),
                FruitConst.sizedBoxHeight20,
                Stack(
                  children: [
                    _containerImage(context),
                    _positionedImage(context),
                    _containerText(),
                    _elevatedButtonContainer(),
                  ],
                ),
                FruitConst.sizedBoxHeight20,
                _rowTwoText(),
                FruitConst.sizedBoxHeight10,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _cardDesignOne(context),
                      _cardDesigntwo(context),
                    ],
                  ),
                ),
                FruitConst.sizedBoxHeight10,
                _rowTwoTextNew(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _cardDesignThree(context),
                      _cardDesignFour(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Card _cardDesignFour(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: FruitConst.borderRadiusCircular20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Image.asset(FruitConst.green_brocoli)),
            const TextSmallMedium(
              text: FruitConst.green_broccoli,
            ),
            _textSmallOne(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FruitConst.f_many,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black),
                ),
                const Text(
                  FruitConst.text_price_line,
                  style: TextStyle(
                    color: FruitConst.colorgrey,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                  ),
                ),
                FruitConst.sizedBoxWidth20,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>const  FruitsBrocoli()));
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 35,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  

  Card _cardDesignThree(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: FruitConst.borderRadiusCircular20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Image.asset(FruitConst.potato_f)),
            const TextSmallMedium(
              text: FruitConst.potato_title,
            ),
            _textSmallOne(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FruitConst.f_many,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black),
                ),
                const Text(
                  FruitConst.text_price_line,
                  style: TextStyle(
                    color: FruitConst.colorgrey,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                  ),
                ),
                FruitConst.sizedBoxWidth20,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>const FruitsPotato()
                          ));
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 35,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _rowTwoTextNew() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextMedium(text: FruitConst.new_item),
        TextGreen(text: FruitConst.see_all),
      ],
    );
  }

  Card _cardDesigntwo(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: FruitConst.borderRadiusCircular20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Image.asset(FruitConst.tomato_image)),
            const TextSmallMedium(
              text: FruitConst.tomatoes_title,
            ),
            _textSmallOne(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FruitConst.f_many,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black),
                ),
                const Text(
                  FruitConst.text_price_line,
                  style: TextStyle(
                    color: FruitConst.colorgrey,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                  ),
                ),
                FruitConst.sizedBoxWidth20,
                Row(
                  children: [
                    IconButton(
                       onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>const FruitsTomatoes()
                          ));
                       },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 35,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _cardDesignOne(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: FruitConst.borderRadiusCircular20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                FruitConst.marul_one,
              ),
            ),
            _textSmallMediumOne(),
            _textSmallOne(),
            _rowFruits(context),
          ],
        ),
      ),
    );
  }

  Row _rowFruits(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          FruitConst.f_many,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black),
        ),
        const Text(
          FruitConst.text_price_line,
          style: TextStyle(
            color: FruitConst.colorgrey,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2,
          ),
        ),
        FruitConst.sizedBoxWidth20,
        Row(
          children: [
            IconButton(
                onPressed: ()  {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>const FruitsCabbage()
                          ));
                       },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 35,
                )),
          ],
        ),
      ],
    );
  }

  TextSmall _textSmallOne() {
    return const TextSmall(
      text: FruitConst.kg_m,
    );
  }

  TextSmallMedium _textSmallMediumOne() {
    return const TextSmallMedium(
      text: FruitConst.marul_title,
    );
  }

  Row _rowTwoText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextMedium(text: FruitConst.home_title),
        TextGreen(text: FruitConst.see_all),
      ],
    );
  }

  Positioned _elevatedButtonContainer() {
    return Positioned(
      top: 100,
      left: 20,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
          onPressed: () {},
          child: const Text(FruitConst.container_elv_text)),
    );
  }

  Padding _containerText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: TextMedium(
        text: FruitConst.container_title,
      ),
    );
  }

  Container _containerImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: FruitConst.borderRadiusCircular20,
        color: const Color.fromARGB(255, 182, 245, 184),
      ),
    );
  }

  Positioned _positionedImage(BuildContext context) {
    return Positioned(
      top: 10,
      right: 5,
      child: Image.asset(
        FruitConst.fruitss_image,
        height: MediaQuery.of(context).size.height / 5,
        //width: MediaQuery.of(context).size.width
      ),
    );
  }

  Row _rowAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  size: 40,
                )),
            FruitConst.sizedBoxWidth20,
            Text(
              'Location',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 40,
                )),
          ],
        )
      ],
    );
  }
}
