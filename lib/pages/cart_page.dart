import 'package:app_04/models/order_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = Provider.of<Cart>(context).items.values.toList();
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
            child: Row(
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 75,
                ),
                const Text(
                  'Carrinho',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'RepublicaMinor'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RepublicaMinor',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Chip(
                    backgroundColor: Color.fromRGBO(0, 158, 223, 1),
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pirulen',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      cart.clear();
                    },
                    child: const Text(
                      'Comprar',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontFamily: 'RepublicaMinor',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) => CartItemWidget(
                    cartItem: items[index],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
