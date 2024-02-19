import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/pages/meals_page.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/meal_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, CategoryModule categoryModule) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryModule.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsPage(title: categoryModule.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            categoryModule: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
