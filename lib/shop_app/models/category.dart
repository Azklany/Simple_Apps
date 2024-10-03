import 'package:flutter/material.dart';

enum Categories {
  hygiene,
  convenience,
  sweets,
  spices,
  carbs,
  dairy,
  meat,
  fruit,
  vegetables,
  other
}

class Category {
  final String name;
  final Color color;

  const Category(this.name, this.color);
}
