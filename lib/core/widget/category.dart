import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.icon, required this.title, required this.onTap});

  final IconData? icon;
  final String? title;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child:  Icon(
              icon,
              color: Colors.blueAccent.shade700,
            ),
          ),
        ),
      const   SizedBox(height: 5),
         Text(
         title??"title yok ",
          textAlign: TextAlign.center,
          style: TextStyle(color:  Colors.blueAccent.shade700),
        )
      ],
    );
  }
}