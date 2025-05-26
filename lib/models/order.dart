import 'cart_items.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime dateTime;
  final String paymentMethod; // COD, PayPal, Stripe, etc.
  final String status; // Pending, Completed, Failed

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.dateTime,
    required this.paymentMethod,
    required this.status,
  });
}
