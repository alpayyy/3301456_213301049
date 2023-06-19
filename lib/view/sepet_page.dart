import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:final_projem/view/sepet_page.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(products.length, 1);
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
      products[index].isAddedToCart = true;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      } else {
        products[index].isAddedToCart = false;
      }
    });
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'tr_TR', symbol: '₺');
    return formatter.format(amount);
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    List<String> sepetUrunler = products.map((product) => product.isim).toList();
    for (int i = 0; i < sepetUrunler.length; i++) {
      String urun = sepetUrunler[i];
      VegetableCard product = products.firstWhere((product) => product.isim == urun);
      totalPrice += product.price * quantities[i];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    List<String> sepetUrunler = products.map((product) => product.isim).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sepet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.lightGreen[200],
            ),
            child: const Center(
              child: Text('Her zaman taze ürünler sizlerle'),
            ),
          ),
          sepetUrunler.length == 0
              ? const Expanded(
                  child: Center(
                    child: Text(
                      'Sepetiniz boş',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              : Flexible(
                  child: ListView.separated(
                    itemCount: sepetUrunler.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      String urun = sepetUrunler[index];
                      VegetableCard product = products.firstWhere((product) => product.isim == urun);
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image.asset(
                                product.image,
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.isim,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      formatCurrency(product.price),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () => decreaseQuantity(index),
                                        ),
                                        Text(quantities[index].toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () => increaseQuantity(index),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    sepetUrunler.removeAt(index);
                                    quantities.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          sepetUrunler.length != 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Toplam:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatCurrency(calculateTotalPrice()),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Ödeme işlemleri için gerekli işlemler burada yapılabilir
                        },
                        child: const Text('Ödeme Yap'),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class VegetableCard {
  final String isim;
  final double price;
  final String image;
  bool isAddedToCart;

  VegetableCard({
    required this.isim,
    required this.price,
    required this.image,
    this.isAddedToCart = false,
  });
}

final List<VegetableCard> products = [
  VegetableCard(
    isim: 'Domates',
    price: 2.99,
    image: 'assets/images/domates.png',
  ),
  VegetableCard(
    isim: 'Brokoli',
    price: 1.99,
    image: 'assets/images/brocoli.png',
  ),
  VegetableCard(
    isim: 'Patates',
    price: 0.99,
    image: 'assets/images/potato.png',
  ),
];
