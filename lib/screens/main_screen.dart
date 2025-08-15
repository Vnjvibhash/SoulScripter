import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:soulscripter/screens/home_screen.dart';
import 'package:soulscripter/screens/profile_screen.dart';
import 'package:soulscripter/screens/quote_composer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const QuoteComposer(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _iconColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.white70;
  }

  Color _backgroundColorFor(int index, ThemeData theme) {
    switch (index) {
      case 0:
        return Colors.transparent;
      case 1:
        return Colors.transparent;
      case 2:
        return Colors.grey[100]!;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: _backgroundColorFor(_selectedIndex, theme),
        color: theme.colorScheme.primary,
        buttonBackgroundColor: theme.colorScheme.primary,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: _iconColor(0)),
          Icon(Icons.add, size: 30, color: _iconColor(1)),
          Icon(Icons.person, size: 30, color: _iconColor(2)),
        ],
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: _onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}
