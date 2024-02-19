import 'package:flutter/material.dart';

class CategoryModule {
  final String id;
  final String title;
  final Color color;

  const CategoryModule(
      {required this.id, required this.title, this.color = Colors.orange});
}
