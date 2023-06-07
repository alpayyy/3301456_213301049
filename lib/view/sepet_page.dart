import 'package:flutter/material.dart';

class SepetPage extends StatefulWidget {
  const SepetPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SepetPageState createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  int itemCount = 0;

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  void confirmCart() {
    // Sepeti onaylama işlemleri
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sepet Onaylandı'),
          content: const Text('Sepetiniz onaylandı!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ürün Sayısı: $itemCount',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    incrementItem();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    decrementItem();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                confirmCart();
              },
              child: const Text('Sepeti Onayla'),
            ),
          ],
        ),
      ),
    );
  }
}
