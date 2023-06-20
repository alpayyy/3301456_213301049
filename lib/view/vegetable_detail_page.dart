import 'package:flutter/material.dart';
import 'package:final_projem/view/sepet_page.dart';

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

  void addToCart(BuildContext context) {
    String image = widget.image;
    String name = widget.name;
    double price = double.parse(widget.price);

    VegetableCard product = VegetableCard(
      name: name,
      price: price,
      image: image,
      weight: weight,
    );

    Sepet.addToCart(product); // Sepet sınıfı kullanılıyor

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ),
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
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 179, 42, 42),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.remove, size: 30),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: increaseWeight,
                            child: Ink(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 164, 34, 34),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      addToCart(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 34, 146, 19),
                      ),
                      child: const Text(
                        "Sepete Ekle",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
