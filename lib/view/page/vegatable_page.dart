// ignore_for_file: unnecessary_null_comparison

import 'package:final_projem/view/vegetable_detail_page.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class VegatablePage extends StatelessWidget {
  List<VegatableCard> listVegatableCard = const [
    VegatableCard(
      image: 'assets/images/potato.png',
      fruitName: 'Patates',
      fruitDetail: 'patates açıklaması',
      price: '0.99',
    ),
    VegatableCard(
      image: 'assets/images/domates.png',
      fruitName: 'Domates',
      fruitDetail: 'Domates açıklaması',
      price: '1.99',
    ),
    VegatableCard(
      image: 'assets/images/brocoli.png',
      fruitName: 'Brokoli',
      fruitDetail: 'Brokoli açıklaması',
      price: '6.22',
    ),
    VegatableCard(
      image: 'assets/images/marul.png',
      fruitName: 'Marul',
      fruitDetail: 'Marul açıklaması',
      price: '4.99',
    ),
    VegatableCard(
      image: 'assets/images/biber.png',
      fruitName: 'Biber',
      fruitDetail: 'Biber açıklaması',
      price: '2.49',
    ),
    VegatableCard(
      image: 'assets/images/patlıcan.png',
      fruitName: 'Patlıcan',
      fruitDetail: 'Patlıcan açıklaması',
      price: '1.99',
    ),
    VegatableCard(
      image: 'assets/images/pırasa.png',
      fruitName: 'Pırasa',
      fruitDetail: 'Pırasa açıklaması',
      price: '5.99',
    ),
    VegatableCard(
      image: 'assets/images/sogan.png',
      fruitName: 'Soğan',
      fruitDetail: 'Soğan açıklaması',
      price: '3.99',
    ),
    VegatableCard(
      image: 'assets/images/kabak.png',
      fruitName: 'Kabak',
      fruitDetail: 'Kabak açıklaması',
      price: '3.99',
    ),
  ];

  VegatablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sebzeler'),
      ),
      body: listVegatableCard.length == null || listVegatableCard.isEmpty
          ? const Center(
              child: Text("Şuan listenin içi boş "),
            )
          : ListView.builder(
              itemCount: listVegatableCard.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VegetableDetailPage(
                        image: listVegatableCard[index].image,
                        name: listVegatableCard[index].fruitName,
                        nameAciklama: listVegatableCard[index].fruitDetail,
                        price: listVegatableCard[index].price,
                      ),
                    ));
                  },
                  child: VegatableCard(
                    image: listVegatableCard[index].image,
                    fruitName: listVegatableCard[index].fruitName,
                    fruitDetail: listVegatableCard[index].fruitDetail,
                    price: listVegatableCard[index].price,
                  ),
                );
              },
            ),
    );
  }
}

class VegatableCard extends StatelessWidget {
  final String image;
  final String fruitName;
  final String price;

  final String fruitDetail;

  const VegatableCard(
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
