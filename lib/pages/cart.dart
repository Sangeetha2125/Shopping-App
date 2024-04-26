import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: Provider.of<CartProvider>(context).cart.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item =
                Provider.of<CartProvider>(context).cart[index];
            return CartItem(cartItem: item);
          },
        ),
      ),
    );
  }
}
