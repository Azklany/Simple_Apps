import 'package:app_one/chart/chartbar.dart';
import 'package:app_one/data/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.food),
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.work),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.apartment),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.travel),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var e in buckets) {
      if (e.totalExpenses > maxTotalExpense) {
        maxTotalExpense = e.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.3),
            Theme.of(context).colorScheme.primary.withOpacity(.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final e in buckets)
                  ChartBar(
                    fill: e.totalExpenses == 0
                        ? 0
                        : e.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: buckets
                  .map((e) => Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          categoryIcon[e.category],
                          color: isDarkMode
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.7),
                        ),
                      )))
                  .toList())
        ],
      ),
    );
  }
}
