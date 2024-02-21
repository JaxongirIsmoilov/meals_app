import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/pages/meals_page.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/meal_data.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, CategoryModule categoryModule) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryModule.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsPage(
          title: categoryModule.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      // Padding(padding: EdgeInsets.only(top: 100 - _animationController.value *100), child: child,) animation with padding
      // _animationController.drive(
      //   Tween(
      //     begin: const Offset(0, 0.3),
      //     end: const Offset(0, 0),
      //   ),
      // ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.decelerate),
        ),
        child: child,
      ),
    );
  }
}
