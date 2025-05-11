import '../models/product.dart';  // Correct import

class CartItem {
  final Product product;  // Uppercase P
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}