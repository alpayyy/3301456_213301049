// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class VegetableDetailPage extends StatefulWidget {
  const VegetableDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.nameAciklama,
    required this.price,
  });

  final String image;
  final String name;
  final String nameAciklama;
  final String price;

  @override
  _VegetableDetailPageState createState() => _VegetableDetailPageState();
}

class _VegetableDetailPageState extends State<VegetableDetailPage> {
  int weight = 1; // Sebze ağırlığı

  void decreaseWeight() {
    if (weight > 1) {
      setState(() {
        weight--;
      });
    }
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sebze Detayı'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.image, // Sebze görselini buraya ekleyin
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Sebze açıklamasını buraya ekleyin
                    widget.name,
            
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 15),
                  Text(
                    // Sebze açıklamasını buraya ekleyin
                    widget.nameAciklama,
            
                    style: const TextStyle(fontSize: 18),
                  ),
                   const SizedBox(height: 15),
                  Text(
                    // Sebze açıklamasını buraya ekleyin
                    "Fiyatı : \$${widget.price }  ",
            
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ağırlık: $weight kg',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decreaseWeight,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: increaseWeight,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // addToCart(
                        //     context); // Call the addToCart method on button press
                      },
                      child: const Text('Sepete Ekle'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final String image;
  final String name;
  final int weight;

  CartPage({required this.image, required this.name, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ürün Görseli',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Ürün Adı: $name',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Ağırlık: $weight kg',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
