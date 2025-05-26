// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../ViewModels/AuthViewModel.dart';
// import '../utilities/custumbutton.dart';
//
// class SignUpScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 60),
//                 Center(
//                   child: Text(
//                     'Create Account',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade800,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey.shade400,
//                     labelText: 'Full Name',
//                     hintText: 'Enter your full name',
//                     labelStyle: TextStyle(color: Colors.blue.shade600),
//                     prefixIcon: Icon(
//                       Icons.person,
//                       color: Colors.blue.shade600,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue.shade700,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red, width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     if (value.length < 3) {
//                       return 'Name must be at least 3 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey.shade400,
//                     labelText: 'Email',
//                     hintText: 'Enter your email',
//                     labelStyle: TextStyle(color: Colors.blue.shade600),
//                     prefixIcon: Icon(
//                       Icons.email,
//                       color: Colors.blue.shade600,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue.shade700,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red, width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                         .hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey.shade400,
//                     labelText: 'Password',
//                     hintText: 'Enter your password',
//                     labelStyle: TextStyle(color: Colors.blue.shade600),
//                     prefixIcon: Icon(
//                       Icons.lock,
//                       color: Colors.blue.shade600,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue.shade700,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red, width: 2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     if (value.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 30),
//                 CustomButton(
//                   text: 'Sign Up',
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       try {
//                         bool success = await authViewModel.signup(
//                           _nameController.text.trim(),
//                           _emailController.text.trim(),
//                           _passwordController.text.trim(),
//                         );
//                         if (success) {
//                           Navigator.pushReplacementNamed(context, '/dashboard');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Email already exists'),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Signup failed: ${e.toString()}'),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   backgroundColor: Colors.blue,
//                   textColor: Colors.white,
//                   borderRadius: 10,
//                   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
//                   fontSize: 18,
//                   elevation: 4,
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Have an account? ",
//                       style: TextStyle(fontSize: 15, color: Colors.black),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/login');
//                       },
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                           color: Colors.blue.shade700,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModels/AuthViewModel.dart';
import '../utilities/custumbutton.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    labelStyle: TextStyle(color: Colors.blue.shade600),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
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
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 3) {
                      'Name must be at least 3 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    labelStyle: TextStyle(color: Colors.blue.shade600),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
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
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.blue.shade600),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
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
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          bool success = await authViewModel.signup(
                            _nameController.text.trim(),
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                          if (success) {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Email already exists'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Signup failed: ${e.toString()}'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    borderRadius: 12,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                    fontSize: 20,
                    elevation: 6,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account? ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
    );
  }
}