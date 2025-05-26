import 'package:flutter/material.dart';
import 'CartViewModel.dart';
import '../models/cart_items.dart';

class CheckoutViewModel with ChangeNotifier {
  final CartViewModel _cartViewModel;
  bool _isOrderConfirmed = false;

  CheckoutViewModel(this._cartViewModel);

  bool get isOrderConfirmed => _isOrderConfirmed;
  List<CartItem> get cartItems => _cartViewModel.cartItems;
  double get totalAmount =>
      _cartViewModel.cartItems.fold(0, (sum, item) => sum + (item.product.price * 0.7 * item.quantity));

  void confirmOrder() {
    if (_cartViewModel.cartItems.isEmpty) {
      return;
    }
    _isOrderConfirmed = true;
    notifyListeners();
  }

  void clearCart() {
    _cartViewModel.clearCart();
    _isOrderConfirmed = false;
    notifyListeners();
  }

  void resetOrderStatus() {
    _isOrderConfirmed = false;
    notifyListeners();
  }
}