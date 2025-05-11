import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewModels/AuthViewModel.dart';
import 'ViewModels/cartModel.dart';
import 'Views/Dashboard_Screen.dart';
import 'Views/Forget_Screen.dart';
import 'Views/Login_Screen.dart';
import 'Views/SignUp_Screen.dart';
import 'Views/Splach_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/forget-password': (context) => ForgetPasswordScreen(),
         '/dashboard': (context) => DashboardScreen(),
        },
      ),
    );
  }
}