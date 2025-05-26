import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';
import '../ViewModels/CartViewModel.dart';
import '../ViewModels/CheakoutViewModel.dart';
import '../ViewModels/OrderVewModel.dart';
import '../models/cart_items.dart';
import '../models/product.dart';
import '../tempdata/dummy_data.dart';
import '../utilities/custumbutton.dart';
import 'OrderConformationScreen.dart';
import 'ProdcutDetailsScreen.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   int _selectedIndex = 0;
//   String _selectedCategory = 'All';
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   void _onCategorySelected(String category) {
//     print('Setting category to: $category'); // Debug state change
//     setState(() {
//       _selectedCategory = category;
//     });
//   }
//
//   void _navigateToHome() {
//     setState(() {
//       _selectedIndex = 0;
//       _selectedCategory = 'All';
//     });
//   }
//
//   late final List<Widget> _widgetOptions = <Widget>[
//     HomeTab(
//       selectedCategory: _selectedCategory,
//       onCategorySelected: _onCategorySelected,
//     ),
//     CartTab(navigateToHome: _navigateToHome),
//     ProfileTab(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context);
//     final user = authViewModel.currentUser;
//
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.blue,
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 16,
//               backgroundColor: Colors.white,
//               child: ClipOval(
//                 child: Image.asset(
//                   'assets/saqib.png',
//                   width: 30,
//                   height: 30,
//                   fit: BoxFit.cover,
//                   errorBuilder:
//                       (context, error, stackTrace) =>
//                           Icon(Icons.person, color: Colors.blue, size: 20),
//                 ),
//               ),
//             ),
//             SizedBox(width: 8),
//             Text(
//               user?.name ?? "Guest",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               semanticsLabel: 'Welcome ${user?.name ?? "Guest"}',
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart, color: Colors.white),
//             onPressed: () {
//               setState(() {
//                 _selectedIndex = 1;
//               });
//             },
//             tooltip: 'View Cart',
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.only(top: 30),
//           children: [
//             Container(
//               height: 140,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.blue, Colors.blueAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8),
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.white,
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/saqib.png',
//                           width: 96,
//                           height: 96,
//                           fit: BoxFit.cover,
//                           errorBuilder:
//                               (context, error, stackTrace) => Icon(
//                                 Icons.person,
//                                 color: Colors.blue,
//                                 size: 60,
//                               ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             user?.name ?? 'Guest',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             semanticsLabel: user?.name ?? 'Guest',
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             user?.email ?? 'N/A',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                             semanticsLabel: user?.email ?? 'No email',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home, color: Colors.blue),
//               title: Text(
//                 'Home',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               onTap: () {
//                 setState(() {
//                   _selectedIndex = 0;
//                   _selectedCategory = 'All';
//                 });
//                 Navigator.pop(context);
//               },
//               tileColor: _selectedIndex == 0 ? Colors.blue[50] : null,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             ),
//             Divider(height: 1, thickness: 1),
//             ListTile(
//               leading: Icon(Icons.shopping_cart, color: Colors.blue),
//               title: Text(
//                 'Cart',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               onTap: () {
//                 setState(() {
//                   _selectedIndex = 1;
//                 });
//                 Navigator.pop(context);
//               },
//               tileColor: _selectedIndex == 1 ? Colors.blue[50] : null,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             ),
//             Divider(height: 1, thickness: 1),
//             ListTile(
//               leading: Icon(Icons.person, color: Colors.blue),
//               title: Text(
//                 'Profile',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               onTap: () {
//                 setState(() {
//                   _selectedIndex = 2;
//                 });
//                 Navigator.pop(context);
//               },
//               tileColor: _selectedIndex == 2 ? Colors.blue[50] : null,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             ),
//             Divider(height: 1, thickness: 1),
//             ListTile(
//               leading: Icon(Icons.logout, color: Colors.red),
//               title: Text(
//                 'Logout',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               onTap: () {
//                 authViewModel.logout();
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             ),
//           ],
//         ),
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class HomeTab extends StatefulWidget {
//   final String selectedCategory;
//   final Function(String) onCategorySelected;
//
//   const HomeTab({
//     Key? key,
//     required this.selectedCategory,
//     required this.onCategorySelected,
//   }) : super(key: key);
//
//   @override
//   _HomeTabState createState() => _HomeTabState();
// }
//
// class _HomeTabState extends State<HomeTab> {
//   late String _currentCategory;
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _currentCategory = widget.selectedCategory;
//     _searchController.addListener(() {
//       setState(() {
//         _searchQuery = _searchController.text.trim();
//         print('Search Query Updated: "$_searchQuery"'); // Debug search query
//       });
//     });
//   }
//
//   @override
//   void didUpdateWidget(covariant HomeTab oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.selectedCategory != widget.selectedCategory) {
//       setState(() {
//         _currentCategory = widget.selectedCategory;
//         print('Category Updated: $_currentCategory'); // Debug category change
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(
//       'HomeTab build called with category: $_currentCategory',
//     ); // Debug build
//     final categories = ['All', 'Shirts', 'Shoes', 'Tec'];
//
//     // Filter products based on search query and category
//     final filteredProducts =
//         dummyProducts.where((product) {
//           final query = _searchQuery.toLowerCase();
//           final name = product.name.toLowerCase();
//           final description = product.description.toLowerCase();
//           final category = product.category.toLowerCase();
//
//           // Case-insensitive search for name, description, or category
//           final matchesQuery =
//               _searchQuery.isEmpty ||
//               name.contains(query) ||
//               description.contains(query) ||
//               category.contains(query); // Allow searching by category name
//
//           // Category filter
//           final matchesCategory =
//               _currentCategory == 'All' ||
//               category == _currentCategory.toLowerCase();
//
//           // Debug product filtering
//           print(
//             'Product: ${product.name} | Matches Query: $matchesQuery (Name: $name, Desc: $description, Category: $category, Query: $query) | Matches Category: $matchesCategory (Category: $category, Selected: ${_currentCategory.toLowerCase()})',
//           );
//
//           return matchesQuery && matchesCategory;
//         }).toList();
//
//     print('Filtered Products Count: ${filteredProducts.length}');
//     print(
//       'Filtered Products: ${filteredProducts.map((p) => "${p.name} (${p.category})").toList()}',
//     );
//
//     return Column(
//       children: [
//         // Search Bar
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
//           child: Material(
//             elevation: 2, // Adds shadow to the search bar
//             borderRadius: BorderRadius.circular(25),
//             shadowColor: Colors.grey.withOpacity(0.4),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search products (e.g., Shirt, Tec)',
//                 hintStyle: TextStyle(color: Colors.black),
//                 prefixIcon: Icon(Icons.search, color: Colors.blue[700]),
//                 suffixIcon:
//                     _searchQuery.isNotEmpty
//                         ? IconButton(
//                           icon: Icon(Icons.clear, color: Colors.grey[400]),
//                           onPressed: () {
//                             _searchController.clear();
//                             setState(() {
//                               _searchQuery = '';
//                             });
//                           },
//                         )
//                         : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide(color: Colors.blue[700]!, width: 1.5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide(color: Colors.blue[700]!, width: 1.5),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide(color: Colors.blue, width: 1.5),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[100],
//                 contentPadding: EdgeInsets.symmetric(
//                   vertical: 14,
//                   horizontal: 16,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // Category Bar
//         Container(
//           height: 27,
//           margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children:
//                   categories.map((category) {
//                     final isSelected = _currentCategory == category;
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: AnimatedContainer(
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           boxShadow:
//                               isSelected
//                                   ? [
//                                     BoxShadow(
//                                       color: Colors.blue.withOpacity(0.2),
//                                       spreadRadius: 1,
//                                       blurRadius: 5,
//                                       offset: Offset(0, 2),
//                                     ),
//                                   ]
//                                   : [],
//                         ),
//                         child: CustomButton(
//                           text: category,
//                           onPressed: () {
//                             print('Button Pressed: $category');
//                             widget.onCategorySelected(category);
//                             setState(() {
//                               _currentCategory = category;
//                             });
//                           },
//                           backgroundColor:
//                               isSelected
//                                   ? Colors.blue[700]!
//                                   : Colors.grey[200]!,
//                           textColor: isSelected ? Colors.white : Colors.black,
//                           borderColor:
//                               isSelected ? Colors.blue[900]! : Colors.black12,
//                           borderRadius: 8,
//                           padding: EdgeInsets.only(left: 12, right: 12),
//                           fontSize: 18,
//                           fontWeight:
//                               isSelected ? FontWeight.bold : FontWeight.w500,
//                           elevation: isSelected ? 2 : 0,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ),
//         ),
//         // Product Grid
//         Expanded(
//           child:
//               filteredProducts.isEmpty
//                   ? Center(
//                     child: Text(
//                       _searchQuery.isEmpty
//                           ? 'No products found for $_currentCategory'
//                           : 'No products match your search',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   )
//                   : GridView.builder(
//                     padding: EdgeInsets.only(
//                       top: 6,
//                       left: 10,
//                       right: 10,
//                       bottom: 2,
//                     ),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.63,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                     ),
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return ProductCard(product: product);
//                     },
//                   ),
//         ),
//       ],
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
//     final discountedPrice = product.price * 0.7;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailScreen(product: product),
//           ),
//         );
//       },
//       child: Card(
//         shadowColor: Colors.grey.withOpacity(0.5),
//         elevation: 9,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image Section
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                   child: SizedBox(
//                     height: 125,
//                     width: double.infinity,
//                     child: Image.asset(
//                       product.imageUrl,
//                       fit: BoxFit.fill,
//                       errorBuilder:
//                           (context, error, stackTrace) => Center(
//                             child: Icon(
//                               Icons.broken_image,
//                               color: Colors.grey,
//                               size: 50,
//                             ),
//                           ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 4,
//                   left: 4,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: Colors.red.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       '30% OFF',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 8,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Text Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     maxLines: 1,
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     product.description.isEmpty
//                         ? 'No description'
//                         : product.description,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     maxLines: 2, // Fixed to 2 lines
//                   ),
//                   SizedBox(height: 2),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Rs. ${discountedPrice.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: screenWidth < 360 ? 11 : 12,
//                             color: Colors.green[800],
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       SizedBox(width: 4),
//                       Expanded(
//                         child: Text(
//                           'Rs. ${product.price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: screenWidth < 360 ? 9 : 10,
//                             color: Colors.grey,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             // Button Section
//             Padding(
//               padding: const EdgeInsets.only(bottom: 2, left: 4, right: 4),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 36, // Fixed height for button
//                 child: CustomButton(
//                   text: 'Add to Cart',
//                   onPressed: () {
//                     cartViewModel.addToCart(product);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         backgroundColor: Colors.blue,
//                         content: Text(
//                           textAlign: TextAlign.center,
//                           '${product.name} added to cart!',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         behavior: SnackBarBehavior.floating,
//                       ),
//                     );
//                   },
//                   backgroundColor: Colors.blue,
//                   textColor: Colors.white,
//                   borderColor: Colors.blue[700]!,
//                   borderRadius: 8,
//                   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   elevation: 2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CartTab extends StatefulWidget {
//   final VoidCallback navigateToHome;
//
//   const CartTab({Key? key, required this.navigateToHome}) : super(key: key);
//
//   @override
//   _CartTabState createState() => _CartTabState();
// }
//
// class _CartTabState extends State<CartTab> {
//   int _currentStep = 2; // Review step by default (Shipping -> Payment -> Review)
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CheckoutViewModel(
//         Provider.of<CartViewModel>(context, listen: false),
//       ),
//       child: Consumer<CheckoutViewModel>(
//         builder: (context, checkoutViewModel, child) {
//           final cartViewModel = Provider.of<CartViewModel>(context);
//
//           return cartViewModel.cartItems.isEmpty
//               ? _buildEmptyCart(context)
//               : Column(
//             children: [
//               // Step Indicator (Shipping -> Payment -> Review)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildStepIndicator("Shipping", 0),
//                     _buildStepIndicator("Payment", 1),
//                     _buildStepIndicator("Review", 2),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   padding: EdgeInsets.all(8),
//                   itemCount: cartViewModel.cartItems.length,
//                   itemBuilder: (context, index) {
//                     final cartItem = cartViewModel.cartItems[index];
//                     return _buildCartItem(context, cartItem, cartViewModel);
//                   },
//                 ),
//               ),
//               _buildCartSummary(context, cartViewModel, checkoutViewModel),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildStepIndicator(String title, int step) {
//     bool isActive = _currentStep == step;
//     bool isCompleted = _currentStep > step;
//
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 15,
//           backgroundColor: isCompleted || isActive ? Colors.blue : Colors.grey[300],
//           child: isCompleted
//               ? Icon(Icons.check, color: Colors.white, size: 20)
//               : Text(
//             (step + 1).toString(),
//             style: TextStyle(
//               color: isActive ? Colors.white : Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           title,
//           style: TextStyle(
//             color: isActive || isCompleted ? Colors.blue : Colors.grey,
//             fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEmptyCart(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
//           SizedBox(height: 16),
//           Text(
//             'Your Cart is Empty!',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Add some items to get started.',
//             style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//           ),
//           SizedBox(height: 16),
//           CustomButton(
//             text: 'Continue Shopping',
//             onPressed: widget.navigateToHome,
//             backgroundColor: Colors.blue,
//             textColor: Colors.white,
//             borderRadius: 8,
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             fontSize: 16,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCartItem(
//       BuildContext context,
//       CartItem cartItem,
//       CartViewModel cartViewModel,
//       ) {
//     final discountedPrice = cartItem.product.price * 0.7;
//
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 cartItem.product.imageUrl,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   width: 60,
//                   height: 60,
//                   color: Colors.grey[200],
//                   child: Icon(Icons.broken_image, color: Colors.grey),
//                 ),
//               ),
//             ),
//             SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     cartItem.product.name,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     maxLines: 1,
//                     semanticsLabel: cartItem.product.name,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Rs. ${discountedPrice.toStringAsFixed(2)}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.green[800],
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.remove_circle, color: Colors.blue),
//                         onPressed: () {
//                           cartViewModel.updateQuantity(
//                             cartItem.product.id,
//                             cartItem.quantity - 1,
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Quantity updated'),
//                               duration: Duration(seconds: 1),
//                             ),
//                           );
//                         },
//                         padding: EdgeInsets.zero,
//                         constraints: BoxConstraints(),
//                         tooltip: 'Decrease quantity',
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         '${cartItem.quantity}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       IconButton(
//                         icon: Icon(Icons.add_circle, color: Colors.blue),
//                         onPressed: () {
//                           cartViewModel.updateQuantity(
//                             cartItem.product.id,
//                             cartItem.quantity + 1,
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Quantity updated'),
//                               duration: Duration(seconds: 1),
//                             ),
//                           );
//                         },
//                         padding: EdgeInsets.zero,
//                         constraints: BoxConstraints(),
//                         tooltip: 'Increase quantity',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.delete_outline, color: Colors.red),
//               onPressed: () {
//                 cartViewModel.removeFromCart(cartItem.product.id);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('${cartItem.product.name} removed from cart'),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//               },
//               tooltip: 'Remove item',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCartSummary(
//       BuildContext context,
//       CartViewModel cartViewModel,
//       CheckoutViewModel checkoutViewModel,
//       ) {
//     final totalPrice = cartViewModel.cartItems.fold<double>(
//       0,
//           (sum, item) => sum + (item.product.price * 0.7 * item.quantity),
//     );
//
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Order Items: ${cartViewModel.cartItems.length}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(width: 8),
//             ],
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Subtotal', style: TextStyle(fontSize: 16)),
//               Text(
//                 'Rs. ${totalPrice.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Shipping', style: TextStyle(fontSize: 16)),
//               Text('FREE', style: TextStyle(fontSize: 16, color: Colors.green)),
//             ],
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Rs. ${totalPrice.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           CheckoutButton(
//             cartViewModel: cartViewModel,
//             navigateToHome: widget.navigateToHome,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CheckoutButton extends StatelessWidget {
//   final CartViewModel cartViewModel;
//   final VoidCallback navigateToHome;
//
//   const CheckoutButton({
//     Key? key,
//     required this.cartViewModel,
//     required this.navigateToHome,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CheckoutViewModel>(
//       builder: (context, checkoutViewModel, child) {
//         return Column(
//           children: [
//             if (checkoutViewModel.isOrderConfirmed)
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[50],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.check_circle, color: Colors.green, size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Your order will be processed immediately after confirmation',
//                       style: TextStyle(fontSize: 14, color: Colors.blue),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             SizedBox(height: 12),
//             CustomButton(
//               text: 'PLACE ORDER',
//               onPressed: () {
//                 checkoutViewModel.confirmOrder();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Order Confirmed!')));
//                 Future.delayed(Duration(seconds: 2), () {
//                   navigateToHome();
//                 });
//               },
//               backgroundColor: Colors.green,
//               textColor: Colors.white,
//               borderRadius: 8,
//               padding: EdgeInsets.symmetric(vertical: 14),
//               fontSize: 16,
//               elevation: 4.0,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// class ProfileTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context);
//     final user = authViewModel.currentUser;
//
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundColor: Colors.blue[100],
//               child: ClipOval(
//                 child: Image.asset(
//                   'assets/saqib.png',
//                   width: 116,
//                   height: 116,
//                   fit: BoxFit.cover,
//                   errorBuilder:
//                       (context, error, stackTrace) =>
//                           Icon(Icons.person, color: Colors.blue, size: 80),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               user?.name ?? 'Guest',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[900],
//               ),
//               semanticsLabel: 'Name: ${user?.name ?? "Guest"}',
//             ),
//             SizedBox(height: 8),
//             Text(
//               user?.email ?? 'N/A',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//               semanticsLabel: 'Email: ${user?.email ?? "N/A"}',
//             ),
//             SizedBox(height: 24),
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     _buildDetailRow(
//                       icon: Icons.person,
//                       label: 'Name',
//                       value: user?.name ?? 'Guest',
//                     ),
//                     Divider(height: 24),
//                     _buildDetailRow(
//                       icon: Icons.email,
//                       label: 'Email',
//                       value: user?.email ?? 'N/A',
//                     ),
//                     Divider(height: 24),
//                     _buildDetailRow(
//                       icon: Icons.phone,
//                       label: 'Phone',
//                       value: '0343 9009088',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Edit Profile feature coming soon!'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Edit Profile',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required String value,
//   }) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.blue, size: 24),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 semanticsLabel: '$label: $value',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String _selectedCategory = 'All';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _navigateToHome() {
    setState(() {
      _selectedIndex = 0;
      _selectedCategory = 'All';
    });
  }

  late final List<Widget> _widgetOptions = <Widget>[
    HomeTab(
      selectedCategory: _selectedCategory,
      onCategorySelected: _onCategorySelected,
    ),
    CartTab(navigateToHome: _navigateToHome),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.currentUser;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/saqib.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                      Icon(Icons.person, color: Colors.blue, size: 20),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              user?.name ?? "Guest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              semanticsLabel: 'Welcome ${user?.name ?? "Guest"}',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            tooltip: 'View Cart',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/saqib.png',
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 60,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? 'Guest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            semanticsLabel: user?.name ?? 'Guest',
                          ),
                          SizedBox(height: 4),
                          Text(
                            user?.email ?? 'N/A',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            semanticsLabel: user?.email ?? 'No email',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  _selectedCategory = 'All';
                });
                Navigator.pop(context);
              },
              tileColor: _selectedIndex == 0 ? Colors.blue[50] : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
            Divider(height: 1, thickness: 1),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.blue),
              title: Text(
                'Cart',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
              tileColor: _selectedIndex == 1 ? Colors.blue[50] : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
            Divider(height: 1, thickness: 1),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
              tileColor: _selectedIndex == 2 ? Colors.blue[50] : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
            Divider(height: 1, thickness: 1),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                authViewModel.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const HomeTab({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late String _currentCategory;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _currentCategory = widget.selectedCategory;
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void didUpdateWidget(covariant HomeTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      setState(() {
        _currentCategory = widget.selectedCategory;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Shirts', 'Shoes', 'Tec'];

    final filteredProducts = dummyProducts.where((product) {
      final query = _searchQuery.toLowerCase();
      final name = product.name.toLowerCase();
      final description = product.description.toLowerCase();
      final category = product.category.toLowerCase();

      final matchesQuery =
          _searchQuery.isEmpty ||
              name.contains(query) ||
              description.contains(query) ||
              category.contains(query);

      final matchesCategory =
          _currentCategory == 'All' ||
              category == _currentCategory.toLowerCase();

      return matchesQuery && matchesCategory;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(25),
            shadowColor: Colors.grey.withOpacity(0.4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products (e.g., Shirt, Tec)',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.blue[700]),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[400]),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue[700]!, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue[700]!, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 27,
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                final isSelected = _currentCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ]
                          : [],
                    ),
                    child: CustomButton(
                      text: category,
                      onPressed: () {
                        widget.onCategorySelected(category);
                        setState(() {
                          _currentCategory = category;
                        });
                      },
                      backgroundColor:
                      isSelected ? Colors.blue[700]! : Colors.grey[200]!,
                      textColor: isSelected ? Colors.white : Colors.black,
                      borderColor:
                      isSelected ? Colors.blue[900]! : Colors.black12,
                      borderRadius: 8,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      fontSize: 18,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight
                          .w500,
                      elevation: isSelected ? 2 : 0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: filteredProducts.isEmpty
              ? Center(
            child: Text(
              _searchQuery.isEmpty
                  ? 'No products found for $_currentCategory'
                  : 'No products match your search',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          )
              : GridView.builder(
            padding: EdgeInsets.only(
              top: 6,
              left: 10,
              right: 10,
              bottom: 2,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.63,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final discountedPrice = product.price * 0.7;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.fill,
                      errorBuilder:
                          (context, error, stackTrace) =>
                          Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '30% OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 2),
                  Text(
                    product.description.isEmpty
                        ? 'No description'
                        : product.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rs. ${discountedPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: screenWidth < 360 ? 11 : 12,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Rs. ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: screenWidth < 360 ? 9 : 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 4, right: 4),
              child: SizedBox(
                width: double.infinity,
                height: 36,
                child: CustomButton(
                  text: 'Add to Cart',
                  onPressed: () {
                    cartViewModel.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text(
                          textAlign: TextAlign.center,
                          '${product.name} added to cart!',
                          style: TextStyle(color: Colors.black),
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  borderColor: Colors.blue[700]!,
                  borderRadius: 8,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CartTab extends StatefulWidget {
  final VoidCallback navigateToHome;

  const CartTab({Key? key, required this.navigateToHome}) : super(key: key);

  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  int _currentStep = 2; // Start at Review step for demonstration

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          CheckoutViewModel(
            Provider.of<CartViewModel>(context, listen: false),
          ),
      child: Consumer<CheckoutViewModel>(
        builder: (context, checkoutViewModel, child) {
          final cartViewModel = Provider.of<CartViewModel>(context);

          return cartViewModel.cartItems.isEmpty
              ? _buildEmptyCart(context)
              : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildStepIndicator("Shipping", 0)),
                    Expanded(child: _buildStepConnector()),
                    Expanded(child: _buildStepIndicator("Payment", 1)),
                    Expanded(child: _buildStepConnector()),
                    Expanded(child: _buildStepIndicator("Review", 2)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: cartViewModel.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartViewModel.cartItems[index];
                    return _buildCartItem(context, cartItem, cartViewModel);
                  },
                ),
              ),
              _buildCartSummary(context, cartViewModel, checkoutViewModel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStepIndicator(String title, int step) {
    bool isActive = _currentStep == step;
    bool isCompleted = _currentStep > step;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted || isActive ? Colors.green[600] : Colors
                    .grey[300],
                border: Border.all(
                  color: isCompleted || isActive ? Colors.green[800]! : Colors
                      .grey[400]!,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            if (isCompleted)
              Icon(Icons.check, color: Colors.white, size: 18)
            else
              Text(
                (step + 1).toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive || isCompleted ? Colors.green[800] : Colors
                .grey[600],
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey[300],
        margin: EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Your Cart is Empty!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add some items to get started.',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'Continue Shopping',
            onPressed: widget.navigateToHome,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            borderRadius: 8,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context,
      CartItem cartItem,
      CartViewModel cartViewModel,) {
    final discountedPrice = cartItem.product.price * 0.7;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cartItem.product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[200],
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    semanticsLabel: cartItem.product.name,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rs. ${discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        text: '-',
                        onPressed: () {
                          cartViewModel.updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity - 1,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Quantity updated'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 8,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        fontSize: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${cartItem.quantity}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomButton(
                        text: '+',
                        onPressed: () {
                          cartViewModel.updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity + 1,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Quantity updated'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 8,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
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
                cartViewModel.removeFromCart(cartItem.product.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cartItem.product.name} removed from cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              backgroundColor: Colors.red,
              textColor: Colors.white,
              borderRadius: 8,
              padding: EdgeInsets.all(8),
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context,
      CartViewModel cartViewModel,
      CheckoutViewModel checkoutViewModel,) {
    final totalPrice = cartViewModel.cartItems.fold<double>(
      0,
          (sum, item) => sum + (item.product.price * 0.7 * item.quantity),
    );

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Items: ${cartViewModel.cartItems.length}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              Text(
                'Rs. ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping',
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              Text('FREE',
                  style: TextStyle(fontSize: 16, color: Colors.green[600])),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                'Rs. ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          CheckoutButton(
            cartViewModel: cartViewModel,
            checkoutViewModel: checkoutViewModel,
            navigateToHome: widget.navigateToHome,
            onOrderPlaced: () {
              setState(() {
                _currentStep = 2; // Mark Review as complete
              });
            },
          ),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  final CartViewModel cartViewModel;
  final VoidCallback navigateToHome;

  const CheckoutButton({
    Key? key,
    required this.cartViewModel,
    required this.navigateToHome, required CheckoutViewModel checkoutViewModel, required Null Function() onOrderPlaced,
  }) : super(key: key);

  void _showPaymentDialog(BuildContext context,
      CheckoutViewModel checkoutViewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedPaymentMethod;
        return AlertDialog(
          title: const Text('Select Payment Method'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Cash on Delivery'),
                    leading: Radio<String>(
                      value: 'COD',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('PayPal'),
                    leading: Radio<String>(
                      value: 'PayPal',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Stripe'),
                    leading: Radio<String>(
                      value: 'Stripe',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            CustomButton(
              text: 'Cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              fontSize: 14,
            ),
            CustomButton(
              text: 'Confirm',
              onPressed: () {
                if (selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please select a payment method')),
                  );
                  return;
                }
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderConfirmationScreen(
                          paymentMethod: selectedPaymentMethod!,
                        ),
                  ),
                );
              },
              backgroundColor: Colors.green,
              textColor: Colors.white,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              fontSize: 14,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutViewModel>(
      builder: (context, checkoutViewModel, child) {
        return Column(
          children: [
            if (checkoutViewModel.isOrderConfirmed)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Your order will be processed immediately after confirmation',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'PLACE ORDER',
              onPressed: () {
                if (cartViewModel.cartItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cart is empty!')),
                  );
                  return;
                }
                _showPaymentDialog(context, checkoutViewModel);
              },
              backgroundColor: Colors.green,
              textColor: Colors.white,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(vertical: 14),
              fontSize: 16,
              elevation: 4.0,
            ),
          ],
        );
      },
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.currentUser;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue[100],
              child: ClipOval(
                child: Image.asset(
                  'assets/saqib.png',
                  width: 116,
                  height: 116,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                      Icon(Icons.person, color: Colors.blue, size: 80),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              user?.name ?? 'Guest',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
              semanticsLabel: 'Name: ${user?.name ?? "Guest"}',
            ),
            SizedBox(height: 8),
            Text(
              user?.email ?? 'N/A',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              semanticsLabel: 'Email: ${user?.email ?? "N/A"}',
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow(
                      icon: Icons.person,
                      label: 'Name',
                      value: user?.name ?? 'Guest',
                    ),
                    Divider(height: 24),
                    _buildDetailRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: user?.email ?? 'N/A',
                    ),
                    Divider(height: 24),
                    _buildDetailRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '0343 9009088',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Edit Profile',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Edit Profile feature coming soon!'),
                      duration: Duration(seconds: 2),
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
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                semanticsLabel: '$label: $value',
              ),
            ],
          ),
        ),
      ],
    );
  }
}