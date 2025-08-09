import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteStorage {
  static const String _quotesKey = 'user_quotes';

  // Save a single new quote (append to list)
  static Future<void> saveQuote(Map<String, dynamic> quote) async {
    final prefs = await SharedPreferences.getInstance();
    final currentQuotes = await getQuotes();
    currentQuotes.add(quote);
    await prefs.setString(_quotesKey, jsonEncode(currentQuotes));
  }

  // Retrieve list of quotes
  static Future<List<Map<String, dynamic>>> getQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_quotesKey);
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      return decoded.map((item) => Map<String, dynamic>.from(item)).toList();
    }
    return [];
  }

  // Clear all saved quotes (optional)
  static Future<void> clearQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_quotesKey);
  }
}
