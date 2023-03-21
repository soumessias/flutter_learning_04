import 'package:app_04/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../components/product_item.dart';
import '../models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            width: double.infinity,
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 158, 223, 1),
            ),
            child: Image.asset(
              "assets/images/title_app.png",
              height: 50,
            ),
          ),
          Container(
            height: 742,
            width: double.infinity,
            child: ListView.separated(
              itemCount: loadedProducts.length,
              padding: EdgeInsets.all(20),
              itemBuilder: ((context, index) {
                return ProductItem(product: loadedProducts[index]);
              }),
              separatorBuilder: (context, index) => const SizedBox(
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
