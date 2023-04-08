import 'package:flutter/material.dart';
import '/Widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: dymmyCategories
          .map(
            (category) => CategoryItem(
              id: category.id,
              title: category.title,
              color: category.color,
            ),
          )
          .toList(),
    );
  }
}
