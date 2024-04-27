import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/snackbar.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  void addToCart() {
    if (selectedSize != 0) {
      bool isPresent = Provider.of<CartProvider>(context, listen: false)
          .isPresent(int.parse(widget.product['id']));
      if (!isPresent) {
        Provider.of<CartProvider>(context, listen: false).addProduct({
          "id": widget.product["id"],
          "title": widget.product["title"],
          "price": widget.product["price"],
          "imageUrl": widget.product["imageUrl"],
          "company": widget.product["company"],
          "size": selectedSize,
        });
        customSnackBar(
            context, CustomColors.darkGreen, "Product added successfully");
      } else {
        customSnackBar(context, CustomColors.darkRed, "Product already added");
      }
    } else {
      customSnackBar(context, CustomColors.darkRed, "Please select a size");
    }
  }

  @override
  void dispose() {
    selectedSize = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product['title'] as String,
          style: const TextStyle(
            color: CustomColors.darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              height: 250,
              image: AssetImage(widget.product['imageUrl'] as String),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.topLeft,
            height: 225,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: CustomColors.lighterBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹${widget.product['price']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < (widget.product['sizes']).length; i++)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                            top: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = widget.product['sizes'][i];
                              });
                            },
                            child: Chip(
                              label: Text(
                                widget.product['sizes'][i].toString(),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color:
                                    selectedSize == widget.product['sizes'][i]
                                        ? Colors.white
                                        : null,
                              ),
                              backgroundColor:
                                  selectedSize == widget.product['sizes'][i]
                                      ? CustomColors.darkBlue
                                      : null,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    addToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.darkBlue,
                    minimumSize: const Size.fromHeight(46),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
