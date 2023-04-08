import 'package:flutter/material.dart';

import '/Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
