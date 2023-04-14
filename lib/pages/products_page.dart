import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
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
            child: Row(
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
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
                  width: 27,
                ),
                const Text(
                  'Gerenciar Produtos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
