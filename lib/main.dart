import 'package:flutter/material.dart';
import 'package:receipe_app/Screens/filters_screen.dart';
import 'package:receipe_app/Screens/meal_details_screen.dart';
import '/Screens/category_meals_screen.dart';

import 'Screens/tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipe',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromARGB(255, 234, 234, 231),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w500,
              ),
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
      ),
      // home: const TabsScreen(),
      routes: {
        '/': (context) => TabsScreen(favouriteMeal: _favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(cuurentFilters: _filters, saveFilter: _setFilters),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
            favouriteHandeler: _toggleFavorite, isFavourite: _isMealFavorite),
      },
    );
  }
}
