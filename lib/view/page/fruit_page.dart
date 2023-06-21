// ignore_for_file: unnecessary_null_comparison

import 'package:final_projem/view/page/vegetable_detail_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages


// ignore: must_be_immutable
class FruitPage extends StatelessWidget {
  List<FruitCard> listFruitCard = const [
    FruitCard(
      image: 'assets/images/orange.png',
      fruitName: 'Elma',
      fruitDetail: 'Elma açıklaması',
      price: '0.99',
    ),
    FruitCard(
       image: 'assets/images/muz.png',
      fruitName: 'Muz',
      fruitDetail: 'Muz açıklaması',
      price: '1.99',
    ),
    FruitCard(
      image: 'assets/images/orange.png',
      fruitName: 'PORTAKAL',
      fruitDetail: 'PORTAKAL açıklaması',
      price: '6.22',
    ),
    FruitCard(
      image: 'assets/images/strawberry.png',
      fruitName: 'Çilek',
      fruitDetail: 'Çilek açıklaması',
      price: '4.99',
    ),
    FruitCard(
      image: 'assets/images/uzum.png',
      fruitName: 'Üzüm',
      fruitDetail: 'Üzüm açıklaması',
      price: '2.49',
    ),
    FruitCard(
      image: 'assets/images/watermelon.png',
      fruitName: 'Karpuz',
      fruitDetail: 'Karpuz açıklaması',
      price: '1.99',
    ),
    FruitCard(
      image: 'assets/images/pineapple.png',
      fruitName: 'Ananas',
      fruitDetail: 'Ananas açıklaması',
      price: '5.99',
    ),
    FruitCard(
      image: 'assets/images/sogan.png',
      fruitName: 'Soğan',
      fruitDetail: 'Soğan açıklaması',
      price: '3.99',
    ),
    FruitCard(
      image: 'assets/images/mango.png',
      fruitName: 'Mango',
      fruitDetail: 'Mango açıklaması',
      price: '3.99',
    ),
  ];

  FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meyveler'),
      ),
      body: listFruitCard.length == null || listFruitCard.isEmpty
          ? const Center(
              child: Text("Şuan listenin içi boş "),
            )
          : ListView.builder(
              itemCount: listFruitCard.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VegetableDetailPage(
                        image: listFruitCard[index].image,
                        name: listFruitCard[index].fruitName,
                        nameAciklama: listFruitCard[index].fruitDetail,
                        price: listFruitCard[index].price,
                      ),
                    ));
                  },
                  child: FruitCard(
                    image: listFruitCard[index].image,
                    fruitName: listFruitCard[index].fruitName,
                    fruitDetail: listFruitCard[index].fruitDetail,
                    price: listFruitCard[index].price,
                  ),
                );
              },
            ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final String image;
  final String fruitName;
  final String price;

  final String fruitDetail;

  const FruitCard(
      {super.key,
      required this.image,
      required this.fruitName,
      required this.price,
      required this.fruitDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fruitName),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
