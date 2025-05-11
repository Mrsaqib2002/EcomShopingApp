import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _scale = 0.5;
  double _opacity = 0.0;
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    print('SplashScreen: Initializing... Attempting to load assets/app.png');

    // Initialize animation controller for pulse effect
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start scale and fade animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1.2; // Overshoot for bounce effect
        _opacity = 1.0;
      });
      // Settle scale to 1.0 after initial animation
      Future.delayed(Duration(milliseconds: 600), () {
        setState(() {
          _scale = 1.0;
        });
      });
    });

    // Navigate after 3 seconds
    Timer(Duration(seconds: 3), () {
      print('SplashScreen: Navigating to /login');
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutBack, // Bounce effect
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(milliseconds: 600),
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/app.png',
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                          errorBuilder: (context, error, stackTrace) {
                            print('SplashScreen: Error loading assets/app.png: $error');
                            return Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.store,
                                size: 120,
                                color: Colors.blue,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Welcome to Online Shop',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Poppins', // Optional: Add Poppins font in pubspec.yaml
              ),
              semanticsLabel: 'Welcome to Online Shop',
            ),
          ],
        ),
      ),
    );
  }
}