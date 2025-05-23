import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  int get itemCount => _products.length;

  double get totalPrice {
    double total = 0.0;
    for (var product in _products) {
      final priceString = product.price.replaceAll('R\$ ', '').trim();
      final price = double.tryParse(priceString) ?? 0.0;
      total += price;
    }
    return total;
  }

  // Adicione este getter para calcular a taxa de 10%
  double get deliveryFee => totalPrice * 0.10;

  // Adicione este getter para o valor total com a taxa
  double get totalWithFee => totalPrice + deliveryFee;
}