import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/category_filter.dart';

class FilterItem extends StatelessWidget {
  final String filter;

  const FilterItem({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: GestureDetector(
        onTap: () {
          Provider.of<CategoryFilterProvider>(context, listen: false)
              .selectFilter(filter);
        },
        child: Chip(
          label: Text(filter),
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: Provider.of<CategoryFilterProvider>(context, listen: true)
                      .selectedFilter ==
                  filter
              ? 20
              : 0,
        ),
      ),
    );
  }
}
