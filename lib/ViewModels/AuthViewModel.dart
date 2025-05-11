import 'package:flutter/material.dart';

import '../models/userCart.dart';
import '../tempdata/dummy_data.dart';

class AuthViewModel with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool login(String email, String password) {
    var user = dummyUsers.firstWhere(
          (user) => user.email == email,
      orElse: () => User(id: '', name: '', email: ''),
    );
    if (user.email.isNotEmpty) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool signup(String name, String email, String password) {
    if (!dummyUsers.any((user) => user.email == email)) {
      var newUser = User(id: '${dummyUsers.length + 1}', name: name, email: email);
      dummyUsers.add(newUser);
      _currentUser = newUser;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  bool forgetPassword(String email) {
    return dummyUsers.any((user) => user.email == email);
  }

  // Dummy social login methods
  bool loginWithFacebook() {
    var newUser = User(
      id: '${dummyUsers.length + 1}',
      name: 'Facebook User',
      email: 'facebook${dummyUsers.length + 1}@example.com',
    );
    dummyUsers.add(newUser);
    _currentUser = newUser;
    notifyListeners();
    return true;
  }

  bool loginWithGoogle() {
    var newUser = User(
      id: '${dummyUsers.length + 1}',
      name: 'Google User',
      email: 'google${dummyUsers.length + 1}@example.com',
    );
    dummyUsers.add(newUser);
    _currentUser = newUser;
    notifyListeners();
    return true;
  }

  bool loginWithInstagram() {
    var newUser = User(
      id: '${dummyUsers.length + 1}',
      name: 'Instagram User',
      email: 'instagram${dummyUsers.length + 1}@example.com',
    );
    dummyUsers.add(newUser);
    _currentUser = newUser;
    notifyListeners();
    return true;
  }
}