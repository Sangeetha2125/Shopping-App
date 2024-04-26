import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  bool isPresent(int productId) {
    for (var e in cart) {
      if (int.parse(e['id']) == productId) return true;
    }
    return false;
  }

  void deleteProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
