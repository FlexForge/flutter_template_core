import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/navigation_bar.dart';
import 'package:flutter_template_core/core/common/ui/screens/settings_screen.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_list_screen.dart';
import 'package:flutter_template_core/features/showcase/ui/screens/style_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          PostListScreen(),
          ShowcaseScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: MainNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onTabTapped,
      ),
    );
  }
}
