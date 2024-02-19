import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModule categoryModule;
  final void Function() onSelectCategory;

  const CategoryGridItem({super.key, required this.categoryModule, required this.onSelectCategory});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categoryModule.color.withOpacity(0.55),
              categoryModule.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryModule.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
