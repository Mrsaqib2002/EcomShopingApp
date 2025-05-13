import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModels/AuthViewModel.dart';
import '../ViewModels/cartModel.dart';
import '../models/cart_items.dart';
import '../models/product.dart';
import '../tempdata/dummy_data.dart';
import '../utilities/custumbutton.dart';
import 'ProdcutDetailsScreen.dart';

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
    print('Setting category to: $category'); // Debug state change
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
                              (context, error, stackTrace) => Icon(
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
        print('Search Query Updated: "$_searchQuery"'); // Debug search query
      });
    });
  }

  @override
  void didUpdateWidget(covariant HomeTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      setState(() {
        _currentCategory = widget.selectedCategory;
        print('Category Updated: $_currentCategory'); // Debug category change
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
    print(
      'HomeTab build called with category: $_currentCategory',
    ); // Debug build
    final categories = ['All', 'Shirts', 'Shoes', 'Tec'];

    // Filter products based on search query and category
    final filteredProducts =
        dummyProducts.where((product) {
          final query = _searchQuery.toLowerCase();
          final name = product.name.toLowerCase();
          final description = product.description.toLowerCase();
          final category = product.category.toLowerCase();

          // Case-insensitive search for name, description, or category
          final matchesQuery =
              _searchQuery.isEmpty ||
              name.contains(query) ||
              description.contains(query) ||
              category.contains(query); // Allow searching by category name

          // Category filter
          final matchesCategory =
              _currentCategory == 'All' ||
              category == _currentCategory.toLowerCase();

          // Debug product filtering
          print(
            'Product: ${product.name} | Matches Query: $matchesQuery (Name: $name, Desc: $description, Category: $category, Query: $query) | Matches Category: $matchesCategory (Category: $category, Selected: ${_currentCategory.toLowerCase()})',
          );

          return matchesQuery && matchesCategory;
        }).toList();

    print('Filtered Products Count: ${filteredProducts.length}');
    print(
      'Filtered Products: ${filteredProducts.map((p) => "${p.name} (${p.category})").toList()}',
    );

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Material(
            elevation: 2, // Adds shadow to the search bar
            borderRadius: BorderRadius.circular(25),
            shadowColor: Colors.grey.withOpacity(0.4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products (e.g., Shirt, Tec)',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.blue[700]),
                suffixIcon:
                    _searchQuery.isNotEmpty
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
        // Category Bar
        Container(
          height: 27,
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  categories.map((category) {
                    final isSelected = _currentCategory == category;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow:
                              isSelected
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
                            print('Button Pressed: $category');
                            widget.onCategorySelected(category);
                            setState(() {
                              _currentCategory = category;
                            });
                          },
                          backgroundColor:
                              isSelected
                                  ? Colors.blue[700]!
                                  : Colors.grey[200]!,
                          textColor: isSelected ? Colors.white : Colors.black,
                          borderColor:
                              isSelected ? Colors.blue[900]! : Colors.black12,
                          borderRadius: 8,
                          padding: EdgeInsets.only(left: 12, right: 12),
                          fontSize: 18,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          elevation: isSelected ? 2 : 0,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
        // Product Grid
        Expanded(
          child:
              filteredProducts.isEmpty
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
                    padding: EdgeInsets.only(top: 6,left: 10,right: 10,bottom: 2),
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
    final screenWidth = MediaQuery.of(context).size.width;

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
            // Image Section
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
            // Text Section
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
                    maxLines: 2, // Fixed to 2 lines
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
            // Button Section
            Padding(
              padding: const EdgeInsets.only(bottom: 2,left: 4,right: 4),
              child: SizedBox(
                width: double.infinity,
                height: 36, // Fixed height for button
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: navigateToHome,
            child: Text(
              'Continue Shopping',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    CartItem cartItem,
    CartViewModel cartViewModel,
  ) {
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
                errorBuilder:
                    (context, error, stackTrace) => Container(
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                'Total:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
