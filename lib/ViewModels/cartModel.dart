import 'package:flutter/material.dart';

import '../models/cart_items.dart';
import '../models/product.dart';


class CartViewModel with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addToCart(Product product) {
    var existingItem = _cartItems.firstWhere(
          (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );

    if (_cartItems.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _cartItems.add(existingItem);
    }
    notifyListeners();
  }


  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    var item = _cartItems.firstWhere((item) => item.product.id == productId);
    if (quantity > 0) {
      item.quantity = quantity;
    } else {
      removeFromCart(productId);
    }
    notifyListeners();
  }
}