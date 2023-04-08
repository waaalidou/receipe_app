// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:receipe_app/Screens/categories_screen.dart';
import 'package:receipe_app/Screens/favourites_screen.dart';

import '../Widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  const TabsScreen({super.key, required this.favouriteMeal});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(favouriteMeal: widget.favouriteMeal),
        'title': 'Favourites'
      },
    ];
    super.initState();
  }

  int _activePageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_activePageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_activePageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: themeColorScheme.primary,
            icon: const Icon(Icons.category),
            tooltip: "Categories",
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: themeColorScheme.primary,
            icon: const Icon(Icons.star),
            tooltip: "Favourites",
            label: "Favourites",
          ),
        ],
        backgroundColor: themeColorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: themeColorScheme.secondary,
        currentIndex: _activePageIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
