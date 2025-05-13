import '../models/product.dart';
import '../models/userCart.dart';

List<User> dummyUsers = [
  User(id: '1', name: 'Saqib', email: 'saqib@gmail.com'),
  User(id: '2', name: 'Sana', email: 'sana@gmail.com'),
];

List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'Casual Shirt',
    description: 'Comfortable cotton shirt for daily wear',
    price: 1500,
    imageUrl: 'assets/tshirt.png',
    category: 'Shirts',
  ),
  Product(
    id: '2',
    name: 'Running Shoes',
    description: 'Lightweight shoes for running',
    price: 3500,
    imageUrl: 'assets/sneaker.png',
    category: 'Shoes',
  ),
  Product(
    id: '3',
    name: 'Gaming HeadPhones',
    description: 'High-performance HeadPhones for gaming',
    price: 8500,
    imageUrl: 'assets/hd.png',
    category: 'Tec',
  ),
  Product(
    id: '4',
    name: 'Gaming Laptop',
    description: 'High-performance laptop for gaming',
    price: 20000,
    imageUrl: 'assets/laptop1.png',
    category: 'Tec',
  ),
  Product(
    id: '5',
    name: 'Laptop',
    description: 'High-performance laptop for Coding',
    price: 40000,
    imageUrl: 'assets/l2.png',
    category: 'Tec',
  ),
  Product(
    id: '6',
    name: 'Shirt',
    imageUrl: 'assets/shirt1.png',
    price: 1300,
    description: 'A new design shirt.',
    category: 'Shirts',
  ),
  Product(
    id: '7',
    name: 'Shirt',
    imageUrl: 'assets/2.png',
    price: 1000,
    description: 'Very interesting color for boys.',
    category: 'Shirts',
  ),
  Product(
    id: '8',
    name: 'Keyboard',
    imageUrl: 'assets/k1.png',
    price: 1000,
    description: 'Modern Keyboard.',
    category: 'Tec',
  ),
];