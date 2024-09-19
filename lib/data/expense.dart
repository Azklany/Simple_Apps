import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { food, work, travel, apartment }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.travel_explore,
  Category.apartment: Icons.apartment,
};

var uuid = const Uuid();

class Expense {
  final String id;
  final double amount;
  final String title;
  final Category category;
  final DateTime dateTime;

  Expense(
      {required this.amount,
      required this.title,
      required this.category,
      required this.dateTime})
      : id = uuid.v4();
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory({
    required List<Expense> allExpenses,
    required this.category,
  }) : expenses = allExpenses.where((e) => e.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (var e in expenses) {
      sum += e.amount;
    }
    return sum;
  }
}
