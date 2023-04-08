import 'package:flutter/material.dart';
import 'package:receipe_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'MealsDetailsRoute';
  final void Function(String) favouriteHandeler;
  final bool Function(String) isFavourite;
  const MealDetailsScreen(
      {super.key, required this.favouriteHandeler, required this.isFavourite});
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text("#${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider()
                    ],
                  )),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favouriteHandeler(mealId),
        child: Icon(
            isFavourite(mealId) ? Icons.star_outlined : Icons.star_outline),
      ),
    );
  }
}
