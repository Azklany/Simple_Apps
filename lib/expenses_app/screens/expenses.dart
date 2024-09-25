import 'package:app_one/expenses_app/chart/chart.dart';
import 'package:app_one/expenses_app/data/expense.dart';
import 'package:app_one/expenses_app/screens/addsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> listOfExpenses = [
    Expense(
        amount: 2000.22,
        title: "Title 1",
        category: Category.work,
        dateTime: DateTime.now()),
    Expense(
        amount: 1500.55,
        title: "Title 2",
        category: Category.food,
        dateTime: DateTime.now()),
    Expense(
        amount: 1200.66,
        title: "Title 3",
        category: Category.apartment,
        dateTime: DateTime.now()),
    Expense(
        amount: 500.00,
        title: "Title 4",
        category: Category.travel,
        dateTime: DateTime.now()),
  ];

  void addCat(Expense expense) {
    setState(() {
      listOfExpenses.add(expense);
    });
  }

  void removeCat(Expense expense) {
    setState(() {
      listOfExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return AddSheet(addCat: addCat);
                  },
                  // isScrollControlled: true,
                  useSafeArea: true,
                );
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text("Expenses"),
      ),
      body: Center(
          child: width < 600
              ? Column(
                  children: [
                    Expanded(child: Chart(expenses: listOfExpenses)),
                    Expanded(
                        child: ListView.builder(
                            itemCount: listOfExpenses.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                background: Padding(
                                  padding: Theme.of(context).cardTheme.margin!,
                                  child: Container(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                                key: ValueKey(listOfExpenses[index]),
                                onDismissed: (direction) {
                                  removeCat(listOfExpenses[index]);
                                },
                                child: Card(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        listOfExpenses[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                                "\$${listOfExpenses[index].amount.toStringAsFixed(2)}"),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Icon(categoryIcon[
                                                  listOfExpenses[index]
                                                      .category]),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child: Text(DateFormat.yMMMd()
                                                    .format(
                                                        listOfExpenses[index]
                                                            .dateTime)),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              );
                            })),
                  ],
                )
              : Row(
                  children: [
                    Chart(expenses: listOfExpenses),
                    Expanded(
                        child: ListView.builder(
                            itemCount: listOfExpenses.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                background: Padding(
                                  padding: Theme.of(context).cardTheme.margin!,
                                  child: Container(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                                key: ValueKey(listOfExpenses[index]),
                                onDismissed: (direction) {
                                  removeCat(listOfExpenses[index]);
                                },
                                child: Card(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        listOfExpenses[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                                "\$${listOfExpenses[index].amount.toStringAsFixed(2)}"),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Icon(categoryIcon[
                                                  listOfExpenses[index]
                                                      .category]),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child: Text(DateFormat.yMMMd()
                                                    .format(
                                                        listOfExpenses[index]
                                                            .dateTime)),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              );
                            })),
                  ],
                )),
    );
  }
}
