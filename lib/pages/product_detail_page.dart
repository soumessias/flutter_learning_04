import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 158, 223, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
