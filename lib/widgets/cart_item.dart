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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        actionsPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.info_rounded,
              weight: 4,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Remove Product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: const Text(
          "Are you sure to remove this product from cart?",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .deleteProduct(widget.cartItem);
              Navigator.of(context).pop();
              customSnackBar(context, CustomColors.darkGreen,
                  "Product removed successfully");
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
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
              color: CustomColors.darkRed,
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
