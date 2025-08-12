import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulscripter/data/sample_data.dart';

class QuoteProvider extends ChangeNotifier {
  static const String _quotesKey = 'user_quotes';

  List<Map<String, dynamic>> _allQuotes = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get allQuotes => _allQuotes;
  bool get isLoading => _isLoading;

  /// Load both saved + sample quotes
  Future<void> loadQuotes() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_quotesKey);
    List<Map<String, dynamic>> savedQuotes = [];
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      savedQuotes = decoded
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    }

    _allQuotes = [...savedQuotes, ...SampleData.quotes];
    _isLoading = false;
    notifyListeners();
  }

  /// Save a single new quote (append to list + persist)
  Future<void> addQuote(Map<String, dynamic> quote) async {
    final prefs = await SharedPreferences.getInstance();

    // Load existing saved quotes
    final jsonString = prefs.getString(_quotesKey);
    List<Map<String, dynamic>> savedQuotes = [];
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      savedQuotes = decoded
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    }

    // Add new quote
    savedQuotes.insert(0, quote);
    await prefs.setString(_quotesKey, jsonEncode(savedQuotes));

    // Update state
    _allQuotes.insert(0, quote);
    notifyListeners();
  }

  /// Clear only user-saved quotes (keep sample quotes)
  Future<void> clearUserQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_quotesKey);

    _allQuotes = [...SampleData.quotes];
    notifyListeners();
  }

  /// Get a quote by id
  Map<String, dynamic>? getQuoteById(String id) {
    try {
      return _allQuotes.firstWhere((quote) => quote['id'] == id);
    } catch (_) {
      return null;
    }
  }

}
