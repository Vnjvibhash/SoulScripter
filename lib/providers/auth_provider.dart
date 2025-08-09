import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _username;

  String? get username => _username;

  bool get isLoggedIn => _username != null;

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    notifyListeners();
  }

  Future<void> login(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = _extractUsernameFromEmail(email);
    _username = prefix;
    await prefs.setString('username', prefix);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    _username = null;
    notifyListeners();
  }

  String _extractUsernameFromEmail(String email) {
    if (email.contains('@')) {
      return email.split('@')[0];
    }
    return email;
  }
}
