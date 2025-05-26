
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../ViewModels/cartviewModel.dart';
// import '../models/product.dart';
//
// class ProductDetailScreen extends StatefulWidget {
//   final Product product;
//
//   const ProductDetailScreen({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }
//
// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _quantity = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
//     final discountedPrice = widget.product.price * 0.7;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Text(
//           widget.product.name,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     widget.product.imageUrl,
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: 300,
//                     errorBuilder: (context, error, stackTrace) => Center(
//                       child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     left: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.red.withOpacity(0.8),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         '30% OFF',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.product.name,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue[900],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         'Rs. ${discountedPrice.toStringAsFixed(2)}',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green[800],
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Text(
//                         'Rs. ${widget.product.price.toStringAsFixed(2)}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     widget.product.description.isEmpty
//                         ? 'No description available'
//                         : widget.product.description,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text(
//                         'Quantity: ',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.remove_circle, color: Colors.blue),
//                         onPressed: () {
//                           if (_quantity > 1) {
//                             setState(() {
//                               _quantity--;
//                             });
//                           }
//                         },
//                       ),
//                       Text(
//                         '$_quantity',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.add_circle, color: Colors.blue),
//                         onPressed: () {
//                           setState(() {
//                             _quantity++;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: () {
//                         for (int i = 0; i < _quantity; i++) {
//                           cartViewModel.addToCart(widget.product);
//                         }
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             backgroundColor: Colors.blue,
//                             content: Text(
//                               textAlign: TextAlign.center,
//                               '${widget.product.name} ($_quantity) added to cart!',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Add to Cart',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/CartViewModel.dart';
import '../models/product.dart';
import '../utilities/custumbutton.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final discountedPrice = widget.product.price * 0.7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.product.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 300,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '30% OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Rs. ${discountedPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Rs. ${widget.product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.product.description.isEmpty
                        ? 'No description available'
                        : widget.product.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Quantity: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      CustomButton(
                        text: '-',
                        onPressed: () {
                          if (_quantity > 1) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 8,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        fontSize: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '$_quantity',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      CustomButton(
                        text: '+',
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 8,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        for (int i = 0; i < _quantity; i++) {
                          cartViewModel.addToCart(widget.product);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text(
                              textAlign: TextAlign.center,
                              '${widget.product.name} ($_quantity) added to cart!',
                              style: TextStyle(color: Colors.black),
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      borderRadius: 8,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fontSize: 16,
                      elevation: 4.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}