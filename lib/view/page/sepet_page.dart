import 'package:flutter/material.dart';
import 'package:final_projem/view/vegetable_detail_page.dart';

class Sepet {
  static List<VegetableCard> cartProducts = [];

  static void addToCart(VegetableCard product) {
    cartProducts.add(product);
  }

  static void removeFromCart(VegetableCard product) {
    cartProducts.remove(product);
  }

  static double getTotalPrice() {
    double total = 0;
    for (var product in cartProducts) {
      total += product.price * product.weight;
    }
    return total;
  }

  static void clearCart() {
    cartProducts.clear();
  }

  static bool isCartEmpty() {
    return cartProducts.isEmpty;
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sepet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Sepet.clearCart();
                  },
                  child: const Text(
                    'Tümünü Sil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Sepet.cartProducts.length,
              itemBuilder: (context, index) {
                VegetableCard product = Sepet.cartProducts[index];
                return ListTile(
                  leading: Image.asset(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('Ağırlık: ${product.weight} kg'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${product.price * product.weight}'),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Sepet.removeFromCart(product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Toplam Fiyat:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$${Sepet.getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (Sepet.isCartEmpty())
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Sepet Boş',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
