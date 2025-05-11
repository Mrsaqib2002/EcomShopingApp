// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../ViewModels/AuthViewModel.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 60),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20),
//                   Center(
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue.shade800,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Welcome Back',
//                     style: TextStyle(fontSize: 20, color: Colors.blue.shade600),
//                   ),
//                   SizedBox(height: 40),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       labelStyle: TextStyle(color: Colors.blue.shade600),
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Colors.blue.shade600,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue.shade400),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.blue.shade700,
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!RegExp(
//                         r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                       ).hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: _obscureText,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       labelStyle: TextStyle(color: Colors.blue.shade600),
//                       prefixIcon: Icon(Icons.lock, color: Colors.blue.shade600),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureText
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: Colors.blue.shade600,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureText = !_obscureText;
//                           });
//                         },
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue.shade400),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.blue.shade700,
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 3) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/forget-password');
//                       },
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(color: Colors.blue.shade700),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           try {
//                             bool success = await authViewModel.login(
//                               _emailController.text.trim(),
//                               _passwordController.text.trim(),
//                             );
//                             if (success) {
//                               Navigator.pushReplacementNamed(
//                                 context,
//                                 '/dashboard',
//                               );
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('Invalid credentials'),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                             }
//                           } catch (e) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Login failed: ${e.toString()}'),
//                                 backgroundColor: Colors.red,
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green.shade600,
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 19,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Or Sign In With',
//                     style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
//                   ),
//                   SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Facebook Login Button
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         bool success = authViewModel.loginWithFacebook();
//                         if (success) {
//                           Navigator.pushReplacementNamed(context, '/dashboard');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Facebook login failed'),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       },
//                       icon: FaIcon(
//                         FontAwesomeIcons.facebook,
//                         color: Colors.white,
//                         size: 20, // Reduced icon size
//                       ),
//                       label: Text(
//                         'Facebook',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14, // Adjusted text size for consistency
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue.shade800,
//                         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), // Reduced padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8), // Slightly smaller border radius
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 3,),
//                     // Google Login Button
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         bool success = authViewModel.loginWithGoogle();
//                         if (success) {
//                           Navigator.pushReplacementNamed(context, '/dashboard');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Google login failed'),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       },
//                       icon: FaIcon(
//                         FontAwesomeIcons.google,
//                         color: Colors.white,
//                         size: 18, // Reduced icon size
//                       ),
//                       label: Text(
//                         'Google',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14, // Adjusted text size
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red.shade600,
//                         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Reduced padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                    SizedBox(width: 3,),
//                     // Instagram Login Button
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         bool success = authViewModel.loginWithInstagram();
//                         if (success) {
//                           Navigator.pushReplacementNamed(context, '/dashboard');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Instagram login failed'),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       },
//
//                       icon: FaIcon(
//                         FontAwesomeIcons.instagram,
//                         color: Colors.white,
//                         size: 18, // Reduced icon size
//                       ),
//                       label: Text(
//                         'Instagram',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14, // Adjusted text size
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink.shade600,
//                         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Reduced padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/signup');
//                       },
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           color: Colors.blue.shade700,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Don't have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/signup');
//                         },
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             color: Colors.blue.shade700,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../ViewModels/AuthViewModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Placeholder for logo
                        ClipOval  (

                          child: Image.asset(
                            'assets/app.png',fit: BoxFit.fill,
                            height: 130,
                            width: 130,

                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.store,
                              size: 80,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                              color: Colors.blue
                          ),
                          semanticsLabel: 'Login',
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 18,
                              color: Colors.blue
                          ),
                          semanticsLabel: 'Welcome Back',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Form Fields
            TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      hintText: 'Email',
                      labelStyle: TextStyle(color: Colors.blue.shade600),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue.shade600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade700,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      hintText: 'Password',
                      labelStyle: TextStyle(color: Colors.blue.shade600),
                      prefixIcon: Icon(Icons.lock, color: Colors.blue.shade600),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blue.shade600,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade700,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 3) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forget-password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            bool success = await authViewModel.login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                            if (success) {
                              Navigator.pushReplacementNamed(
                                context,
                                '/dashboard',
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid credentials'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login failed: ${e.toString()}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                          : Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 14),
                  // Social Login Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey.shade400),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Or Sign In With',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Social Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton(
                        context: context,
                        icon: FontAwesomeIcons.facebook,

                        label: 'Facebook',
                        color: Colors.blue.shade800,
                        onPressed: () {
                          bool success = authViewModel.loginWithFacebook();
                          if (success) {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Facebook login failed'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                      _buildSocialButton(
                        context: context,
                        icon: FontAwesomeIcons.google,
                        label: 'Google',
                        color: Colors.red.shade600,
                        onPressed: () {
                          bool success = authViewModel.loginWithGoogle();
                          if (success) {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Google login failed'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                      _buildSocialButton(
                        context: context,
                        icon: FontAwesomeIcons.instagram,
                        label: 'Instagram',
                        color: Colors.pink.shade600,
                        onPressed: () {
                          bool success = authViewModel.loginWithInstagram();
                          if (success) {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Instagram login failed'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // Signup Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: Colors.white,
        size: 17,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
    );
  }
}