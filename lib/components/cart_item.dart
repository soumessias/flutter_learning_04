import 'package:app_04/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: FittedBox(
              child: Text(
                cartItem.price.toStringAsFixed(2),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          cartItem.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
        trailing: Text('${cartItem.quantity}x'),
      ),
    );
  }
}
