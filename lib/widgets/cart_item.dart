import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/snackbar.dart';

class CartItem extends StatefulWidget {
  final Map<String, dynamic> cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeFromCart() {
    Provider.of<CartProvider>(context, listen: false)
        .deleteProduct(widget.cartItem);
    customSnackBar(context, darkGreen, "Product removed successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              widget.cartItem['imageUrl'] as String,
            ),
            backgroundColor: Colors.white,
          ),
          title: Text(
            widget.cartItem['title'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            "₹${widget.cartItem['price']}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              removeFromCart();
            },
            child: const Icon(
              Icons.delete,
              color: darkRed,
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
