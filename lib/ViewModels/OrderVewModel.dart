import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart_items.dart';

class OrderViewModel with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void placeOrder({
    required List<CartItem> items,
    required double totalAmount,
    required String paymentMethod,
  }) {
    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      totalAmount: totalAmount,
      dateTime: DateTime.now(),
      paymentMethod: paymentMethod,
      status: 'Pending',
    );

    _orders.add(newOrder);
    notifyListeners();
  }
}
