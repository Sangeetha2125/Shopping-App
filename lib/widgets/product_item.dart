import 'package:flutter/material.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/pages/product_details.dart';

class ProductItem extends StatefulWidget {
  final int index;
  final Map<String, dynamic> product;
  const ProductItem({super.key, required this.product, required this.index});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: widget.product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(width: .5),
          color: widget.index.isEven ? null : CustomColors.lightBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product['title'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: CustomColors.darkBlue,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "₹${widget.product['price']}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Image(
                width: 200,
                image: AssetImage(
                  widget.product['imageUrl'] as String,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
