import 'package:flutter/material.dart';
import 'package:receipe_app/Screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.mealId,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
    }
  }

  String get afforadabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: mealId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(11),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(afforadabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
