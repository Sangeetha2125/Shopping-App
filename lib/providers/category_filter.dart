import 'package:flutter/material.dart';

class CategoryFilterProvider extends ChangeNotifier {
  String selectedFilter = "All Collections";
  void selectFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }
}
