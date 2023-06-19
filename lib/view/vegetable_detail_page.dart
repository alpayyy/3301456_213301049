import 'package:final_projem/view/sepet_page.dart';
import 'package:flutter/material.dart';

class VegetableDetailPage extends StatefulWidget {
  const VegetableDetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.nameAciklama,
    required this.price,
  }) : super(key: key);

  final String image;
  final String name;
  final String nameAciklama;
  final String price;

  @override
  _VegetableDetailPageState createState() => _VegetableDetailPageState();
}

class _VegetableDetailPageState extends State<VegetableDetailPage> {
  int weight = 1;
  List<VegetableCard> cartProducts = [];

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

  void addToCart() {
    final VegetableCard product = VegetableCard(
      name: widget.name,
      price: double.parse(widget.price),
      image: widget.image,
      weight: weight,
    );

    setState(() {
      cartProducts.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ürün sepete eklendi')),
    );
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
                widget.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.nameAciklama,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Fiyatı: \$${widget.price}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ağırlık: $weight kg',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: decreaseWeight,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.remove, size: 30),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: increaseWeight,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Sepete Ekle',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VegetableCard {
  final String name;
  final double price;
  final String image;
  final int weight;

  VegetableCard({
    required this.name,
    required this.price,
    required this.image,
    required this.weight,
  });
}
