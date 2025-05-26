import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewModels/AuthViewModel.dart';
import 'ViewModels/CartViewModel.dart';
import 'ViewModels/CheakoutViewModel.dart';
import 'ViewModels/OrderVewModel.dart';
import 'Views/CheackoutScreen.dart';
import 'Views/Dashboard_Screen.dart';
import 'Views/Forget_Screen.dart';
import 'Views/Login_Screen.dart';
import 'Views/SignUp_Screen.dart';
import 'Views/Splach_Screen.dart';
import 'Views/OrderConformationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),
        ChangeNotifierProvider(
          create: (context) => CheckoutViewModel(
            Provider.of<CartViewModel>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/SplashScreen': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/forget-password': (context) => ForgetPasswordScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/checkout': (context) => CheckoutScreen(),
          '/order-confirmation': (context) => const OrderConfirmationScreen(paymentMethod: 'COD'), // Default for safety
        },
      ),
    );
  }
}