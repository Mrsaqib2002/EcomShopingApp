import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/CartViewModel.dart';
import '../ViewModels/CheakoutViewModel.dart';
import '../ViewModels/OrderVewModel.dart';
import '../models/cart_items.dart';
import '../utilities/custumbutton.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    final checkoutVM = Provider.of<CheckoutViewModel>(context);
    final cartVM = Provider.of<CartViewModel>(context);
    final orderVM = Provider.of<OrderViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: cartVM.cartItems.isEmpty
          ? _buildEmptyCart(context)
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Cart Summary'),
              _buildCartSummary(context, cartVM),
              const SizedBox(height: 16),
              _buildSectionTitle('Shipping Information'),
              _buildShippingInfo(),
              const SizedBox(height: 16),
              _buildSectionTitle('Payment Method'),
              _buildPaymentMethodSelection(),
              const SizedBox(height: 16),
              _buildSectionTitle('Order Summary'),
              _buildOrderSummary(checkoutVM, orderVM, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Your Cart is Empty!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add some items to proceed.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Continue Shopping',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/dashboard',
                    (route) => false,
                arguments: {'tabIndex': 0},
              );
            },
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            borderRadius: 8,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            fontSize: 16,
            elevation: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, CartViewModel cartVM) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: cartVM.cartItems.asMap().entries.map((entry) {
            final index = entry.key;
            final cartItem = entry.value;
            final discountedPrice = cartItem.product.price * 0.7;
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.product.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rs. ${discountedPrice.toStringAsFixed(2)} x ${cartItem.quantity}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CustomButton(
                                text: '-',
                                onPressed: () {
                                  cartVM.updateQuantity(
                                    cartItem.product.id,
                                    cartItem.quantity - 1,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Quantity updated')),
                                  );
                                },
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                borderRadius: 8,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                fontSize: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${cartItem.quantity}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              CustomButton(
                                text: '+',
                                onPressed: () {
                                  cartVM.updateQuantity(
                                    cartItem.product.id,
                                    cartItem.quantity + 1,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Quantity updated')),
                                  );
                                },
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                borderRadius: 8,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: '',
                      icon: Icons.delete_outline,
                      onPressed: () {
                        cartVM.removeFromCart(cartItem.product.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${cartItem.product.name} removed')),
                        );
                      },
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      borderRadius: 8,
                      padding: const EdgeInsets.all(8),
                      fontSize: 16,
                    ),
                  ],
                ),
                if (index < cartVM.cartItems.length - 1) const Divider(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'John Doe\n123 Main Street\nKarachi, Pakistan\nPhone: 0343 9009088',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Note: Editable shipping address coming soon!',
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RadioListTile<String>(
              title: const Text('Cash on Delivery'),
              value: 'COD',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              activeColor: Colors.blue,
            ),
            RadioListTile<String>(
              title: const Text('PayPal'),
              value: 'PayPal',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              activeColor: Colors.blue,
            ),
            RadioListTile<String>(
              title: const Text('Stripe'),
              value: 'Stripe',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(
      CheckoutViewModel checkoutVM, OrderViewModel orderVM, BuildContext context) {
    final subtotal = checkoutVM.totalAmount;
    const shipping = 0.0;
    final total = subtotal + shipping;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal', style: TextStyle(fontSize: 16)),
                Text('Rs. ${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping', style: TextStyle(fontSize: 16)),
                Text('FREE', style: TextStyle(fontSize: 16, color: Colors.green)),
              ],
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  'Rs. ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Confirm Order',
              onPressed: () {
                if (_selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a payment method')),
                  );
                  return;
                }
                orderVM.placeOrder(
                  items: checkoutVM.cartItems,
                  totalAmount: checkoutVM.totalAmount,
                  paymentMethod: _selectedPaymentMethod!,
                );
                checkoutVM.confirmOrder();
                checkoutVM.clearCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                      Text('Order Confirmed with $_selectedPaymentMethod!')),
                );
                Future.delayed(const Duration(seconds: 2), () {
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/dashboard',
                          (route) => false,
                      arguments: {'tabIndex': 0},
                    );
                  }
                });
              },
              backgroundColor: Colors.green,
              textColor: Colors.white,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(vertical: 14),
              fontSize: 16,
              elevation: 4,
            ),
          ],
        ),
      ),
    );
  }
}