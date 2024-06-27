import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// to store user details
class UserProvider with ChangeNotifier {
  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  Future<void> loadUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _username = prefs.getString('username') ?? '';
      _email = prefs.getString('email') ?? '';
      notifyListeners();
    } catch (e) {
      // ignore error
    }
  }

  Future<void> saveUser(String username, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    _username = username;
    _email = email;
    notifyListeners();
  }
}
