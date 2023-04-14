import 'package:app_04/components/app_drawer.dart';
import 'package:app_04/components/product_grid_item.dart';
import 'package:app_04/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/product_list.dart';
import 'package:badges/badges.dart' as badges;

import '../utils/app_routes.dart';

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
    final cart = Provider.of<Cart>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: Column(
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
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                height: 95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 220,
                    ),
                    PopupMenuButton(
                      splashRadius: 50,
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 35,
                      ),
                      itemBuilder: (_) => [
                        const PopupMenuItem(
                          value: true,
                          child: Text(
                            "Somente Favoritos",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 158, 223, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem(
                          value: false,
                          child: Text(
                            "Todos",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 158, 223, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onSelected: (bool selected) {
                        if (selected) {
                          provider.showFavoriteOnly();
                        } else {
                          provider.showAll();
                        }
                      },
                    ),
                    badges.Badge(
                      badgeContent: Text(
                        cart.itemsCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pirulen',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.redAccent,
                        padding: cart.itemsCount.toInt() != 1
                            ? EdgeInsets.all(7)
                            : EdgeInsets.all(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.cartPage,
                            // arguments: product,
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 27,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 742, //742,
            width: double.infinity,
            child: ListView.separated(
              itemCount: loadedProducts.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider.value(
                  value: loadedProducts[index],
                  child: const ProductGridItem(),
                );
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
