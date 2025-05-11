import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';
import '../ViewModels/cartModel.dart';
import '../models/cart_items.dart';
import '../models/product.dart';
import '../tempdata/dummy_data.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Callback to navigate to HomeTab
  void _navigateToHome() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  // Pass callback to CartTab
  late final List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    CartTab(navigateToHome: _navigateToHome),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.currentUser;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Change drawer and action icon
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/saqib.png', // Default avatar
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 20,
                  ),
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
                _selectedIndex = 1; // Navigate to CartTab
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
                          errorBuilder: (context, error, stackTrace) => Icon(
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

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.67, // Adjusted for better height
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        final product = dummyProducts[index];
        return ProductCard(product: product);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    print('Product: ${product.name}, Description: ${product.description}'); // Debug

    return Card(
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 120, // Reduced from 150 to fit within constraints
              width: double.infinity,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          // Product details
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
                  product.description.isEmpty ? 'No description' : product.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 2),
                Text(
                  'Rs. ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Add to Cart button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
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
                  child: Text(
                    textAlign: TextAlign.center,
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartTab extends StatelessWidget {
  final VoidCallback navigateToHome;

  const CartTab({Key? key, required this.navigateToHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final _ = Theme.of(context);

    return cartViewModel.cartItems.isEmpty
        ? _buildEmptyCart(context)
        : Column(
      children: [
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
        _buildCartSummary(context, cartViewModel),
      ],
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
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
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: navigateToHome, // Use callback to navigate to HomeTab
            child: Text(
              'Continue Shopping',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem cartItem, CartViewModel cartViewModel) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
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
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 12),
            // Product Details
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
                    'Rs. ${cartItem.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Quantity Controls
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.blue),
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
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        tooltip: 'Decrease quantity',
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${cartItem.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Colors.blue),
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
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        tooltip: 'Increase quantity',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Delete Button
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                cartViewModel.removeFromCart(cartItem.product.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cartItem.product.name} removed from cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              tooltip: 'Remove item',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, CartViewModel cartViewModel) {
    final totalPrice = cartViewModel.cartItems.fold<double>(
      0,
          (sum, item) => sum + (item.product.price * item.quantity),
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
                'Total:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Proceeding to checkout...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
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
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue[100],
              child: ClipOval(
                child: Image.asset(
                  'assets/saqib.png',
                  width: 116,
                  height: 116,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 80,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // User Name
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
            // User Email
            Text(
              user?.email ?? 'N/A',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              semanticsLabel: 'Email: ${user?.email ?? "N/A"}',
            ),
            SizedBox(height: 24),
            // Details Card
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
                    // Add phone number if available in AuthViewModel
                    Divider(height: 24),
                    _buildDetailRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '0343 9009088', // Replace with user?.phone if available
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Edit Profile Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Edit Profile feature coming soon!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
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