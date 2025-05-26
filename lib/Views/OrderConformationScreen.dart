import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/CheakoutViewModel.dart';
import '../ViewModels/OrderVewModel.dart';
import '../utilities/custumbutton.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String paymentMethod;

  const OrderConfirmationScreen({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final checkoutVM = Provider.of<CheckoutViewModel>(context, listen: false);
    final orderVM = Provider.of<OrderViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              const Text(
                'Confirm Your Order',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Payment Method: $paymentMethod',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'Total Amount: Rs. ${checkoutVM.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Place Order',
                onPressed: () {
                  if (checkoutVM.cartItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cart is empty!')),
                    );
                    return;
                  }
                  orderVM.placeOrder(
                    items: checkoutVM.cartItems,
                    totalAmount: checkoutVM.totalAmount,
                    paymentMethod: paymentMethod,
                  );
                  checkoutVM.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order Placed Successfully!')),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/dashboard',
                        (route) => false,
                    arguments: {'tabIndex': 0}, // Navigate to HomeTab
                  );
                },
                backgroundColor: Colors.green,
                textColor: Colors.white,
                borderRadius: 8,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                fontSize: 19,
                elevation: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}