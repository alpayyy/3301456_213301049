import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:final_projem/view/sepet_page.dart';
import 'package:flutter/material.dart';

import 'auth/user_page.dart';
import 'fruits_home.dart';
import 'http_paketi_ile_veri_cekme.dart';
import 'kategori_page.dart';


class BottomBarAnimatedPage extends StatefulWidget {
  const BottomBarAnimatedPage({super.key});

  @override
  State<BottomBarAnimatedPage> createState() => _BottomBarAnimatedPageState();
}

class _BottomBarAnimatedPageState extends State<BottomBarAnimatedPage> {
  int selectedPageIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.paste,
    Icons.bookmark_border,
    Icons.person,
  ];
  List<Widget> pageList = [
    const FruitsHome(),
    const KategoriPage(),
    const HttpPaketData(),
    const UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>   const CartPage()));
        },
        child: const Icon(Icons.shopping_cart),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: selectedPageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (pageIndex) {
          setState(() {
            selectedPageIndex = pageIndex;
          });
        },
        //other params
      ),
      body: pageList.elementAt(selectedPageIndex),
    );
  }
}
