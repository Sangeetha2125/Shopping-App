import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constants/global_variables.dart';
import 'package:shopping_app/providers/category_filter.dart';
import 'package:shopping_app/widgets/filter_item.dart';
import 'package:shopping_app/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    "All Collections",
    "Adidas",
    "Nike",
    "VKC Pride",
    "Bata"
  ];
  String selectedFilter = "All Collections";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ChangeNotifierProvider(
            create: (context) => CategoryFilterProvider(),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return FilterItem(
                    filter: filter,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> product = products[index];
                  return ProductItem(
                    product: product,
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
