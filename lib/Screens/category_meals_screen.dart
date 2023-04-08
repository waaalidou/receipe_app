import 'package:flutter/material.dart';
import 'package:receipe_app/Widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routesArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routesArgs["title"] as String;
    final String categoryId = routesArgs["id"] as String;
    displayedMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          mealId: displayedMeals[index].id,
          imageUrl: displayedMeals[index].imageUrl,
          title: displayedMeals[index].title,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,
          affordability: displayedMeals[index].affordability,
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
