import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _username;
  String? _name;

  String? get username => _username;
  String? get name => _name;
  bool get isLoggedIn => _username != null;

  // SharedPreferences keys
  static const String _usernameKey = 'username';
  static const String _nameKey = 'name';
  static const String _usersKey = 'users';

  /// Load currently logged-in user from SharedPreferences
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_usernameKey);
    _name = prefs.getString(_nameKey);
    notifyListeners();
  }

  /// Sign up (register a new user)
  Future<String?> signup(String name, String email, String password) async {
    email = email.trim().toLowerCase();
    final prefs = await SharedPreferences.getInstance();

    final users = _loadUsersFromPrefs(prefs);

    // Check if already exists
    if (users.containsKey(email)) {
      return "Email already registered. Please log in.";
    }

    // Extract username from email
    final prefix = _extractUsernameFromEmail(email);

    // Save new user with full details
    users[email] = {
      "name": name,
      "username": prefix,
      "password": _hashPassword(password),
    };

    await prefs.setString(_usersKey, jsonEncode(users));

    // Auto-login after signup
    _username = prefix;
    _name = name;
    await prefs.setString(_usernameKey, prefix);
    await prefs.setString(_nameKey, name);

    notifyListeners();
    return null;
  }

  /// Login an existing user with validation
  Future<String?> login(String email, String password) async {
    email = email.trim().toLowerCase();
    final prefs = await SharedPreferences.getInstance();

    final users = _loadUsersFromPrefs(prefs);
    if (users.isEmpty) {
      return "No accounts registered. Please sign up first.";
    }

    // Validate credentials
    if (!users.containsKey(email)) {
      return "Email not registered.";
    }
    if (users[email]!["password"] != _hashPassword(password)) {
      return "Incorrect password.";
    }

    // Save login info
    _username = users[email]!["username"];
    _name = users[email]!["name"];
    await prefs.setString(_usernameKey, _username!);
    await prefs.setString(_nameKey, _name!);

    notifyListeners();
    return null;
  }

  /// Guest login
  Future<void> guestLogin() async {
    final prefs = await SharedPreferences.getInstance();
    _username = "Guest";
    _name = "Guest";
    await prefs.setString(_usernameKey, _username!);
    await prefs.setString(_nameKey, _name!);
    notifyListeners();
  }

  /// Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_nameKey);
    _username = null;
    _name = null;
    notifyListeners();
  }

  /// Utility: Extract username from email
  String _extractUsernameFromEmail(String email) {
    if (email.contains('@')) {
      return email.split('@')[0];
    }
    return email;
  }

  /// Utility: Protect Password with SHA-256
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  /// Utility: Safely load users map from SharedPreferences
  Map<String, Map<String, String>> _loadUsersFromPrefs(
    SharedPreferences prefs,
  ) {
    final usersJson = prefs.getString(_usersKey);
    final Map<String, Map<String, String>> users = {};

    if (usersJson != null) {
      try {
        final decoded = jsonDecode(usersJson);
        if (decoded is Map) {
          decoded.forEach((key, value) {
            if (value is Map) {
              users[key] = Map<String, String>.from(value);
            }
          });
        }
      } catch (e) {
        debugPrint("Error decoding stored users: $e");
      }
    }
    return users;
  }
}
