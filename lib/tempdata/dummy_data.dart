import '../models/product.dart';
import '../models/userCart.dart';

List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'T-Shirt',
    imageUrl: 'assets/tshirt.png',
    price: 1500,
    description: 'Comfortable cotton t-shirt.',
  ),
  Product(
    id: '2',
    name: 'Sneakers',
    imageUrl: 'assets/sneaker.png',
    price: 3000,
    description: 'Stylish sneakers for daily wear.',
  ),
  Product(
    id: '3',
    name: 'Headphones',
    imageUrl: 'assets/hd.png',
    price: 2000,
    description: 'High-quality wireless headphones.',
  ),
  Product(
    id: '4',
    name: 'Laptop',
    imageUrl: 'assets/laptop1.png',
    price: 15000,
    description: 'Modern laptop.',
  ),

  Product(
    id: '5',
    name: 'Laptop ',
    imageUrl: 'assets/l2.png',
    price: 13000,
    description: 'Modern laptop.',
  ),

  Product(
    id: '6',
    name: 'Shirt',
    imageUrl: 'assets/shirt1.png',
    price: 1300,
    description: 'A new design shirt.',
  ),

  Product(
    id: '7',
    name: 'Shirt',
    imageUrl: 'assets/2.png',
    price: 1000,
    description: 'Very interesting color for boys .',
  ),

  Product(
    id: '8',
    name: 'Keyboard',
    imageUrl: 'assets/k1.png',
    price: 1000,
    description: 'Modern Keyboard.',
  ),
];

List<User> dummyUsers = [
  User(id: '1', name: 'Saqib', email: 'saqib@gmail.com'),
  User(id: '2', name: 'Sana ', email: 'sana@gmail.com'),
];