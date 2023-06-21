import 'package:final_projem/view/page/vegatable_page.dart';
import 'package:flutter/material.dart';

import '../fruit_page.dart';


class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meyve ve Sebze Kategorileri'),
      ),
      body: ListView(
        children: <Widget>[
          KategoriCard(
            title: 'Meyveler',
            color: Colors.orange,
            icon: Icons.apple,
            page: FruitPage(),
          ),
          KategoriCard(
            title: 'Sebzeler',
            color: Colors.green,
            icon: Icons.eco,
            page: VegatablePage(),
          ),
        ],
      ),
    );
  }
}

class KategoriCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Widget page;

  const KategoriCard({super.key, 
    required this.title,
    required this.color,
    required this.icon,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 60.0,
                color: Colors.white,
              ),
              const SizedBox(height: 80.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: KategoriPage(),
  ));
}
