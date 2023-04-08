import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  const FavouriteScreen({super.key, required this.favouriteMeal});

  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty) {
      return const Center(
        child: Text("You have no favourites yet"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          mealId: favouriteMeal[index].id,
          imageUrl: favouriteMeal[index].imageUrl,
          title: favouriteMeal[index].title,
          duration: favouriteMeal[index].duration,
          complexity: favouriteMeal[index].complexity,
          affordability: favouriteMeal[index].affordability,
        ),
        itemCount: favouriteMeal.length,
      );
    }
  }
}