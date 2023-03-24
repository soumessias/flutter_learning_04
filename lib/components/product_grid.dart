import 'package:app_04/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/product_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  Text menuItem(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(0, 158, 223, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;
    return Column(
      children: [
        Stack(
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
              width: double.infinity,
              height: 95,
              alignment: Alignment.bottomRight,
              child: PopupMenuButton(
                splashRadius: 50,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 35,
                ),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: true,
                    child: menuItem("Somente Favoritos"),
                  ),
                  PopupMenuItem(
                    value: false,
                    child: menuItem("Todos"),
                  )
                ],
                onSelected: (bool selected) {
                  if (selected) {
                    provider.showFavoriteOnly();
                  } else {
                    provider.showAll();
                  }
                },
              ),
            ),
          ],
        ),
        Container(
          height: 742,
          width: double.infinity,
          child: ListView.separated(
            itemCount: loadedProducts.length,
            padding: EdgeInsets.all(20),
            itemBuilder: ((context, index) {
              return ChangeNotifierProvider.value(
                value: loadedProducts[index],
                child: ProductItem(),
              );
            }),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
