import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/expense.dart';

class AddSheet extends StatefulWidget {
  const AddSheet({super.key, required this.addCat});

  final void Function(Expense expense) addCat;

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  TextEditingController titleControler = TextEditingController();
  TextEditingController amountControler = TextEditingController();
  String selectedDate = "Select Date";
  Category currCat = Category.food;
  @override
  void dispose() {
    super.dispose();
    titleControler.dispose();
    amountControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                maxLength: 50,
                decoration: const InputDecoration(
                    label: Text("Title"), hintText: "Enter Title"),
                controller: titleControler,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                          label: Text("Amount"),
                          hintText: "Enter Amount",
                          prefixText: "\$"),
                      controller: amountControler,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Row(
                    children: [
                      Text(selectedDate),
                      IconButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.now())
                                .then((e) {
                              setState(() {
                                selectedDate = DateFormat.yMMMd().format(e!);
                              });
                            });
                          },
                          icon: const Icon(Icons.calendar_today))
                    ],
                  )
                ],
              ),
              DropdownButton(
                value: currCat,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val == null) {
                    return;
                  }
                  setState(() {
                    currCat = val;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        double? amountVal = double.tryParse(amountControler.text);
                        if (titleControler.text.trim().isEmpty ||
                            amountVal == null ||
                            amountVal < 0 ||
                            selectedDate == "Select Date") {
                          log("error");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Error")));
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("data"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: const Text("OK"))
                                  ],
                                );
                              });
                        }
                        // setState(() {
                        widget.addCat(Expense(
                            amount: amountVal!,
                            title: titleControler.text,
                            category: currCat,
                            dateTime: DateTime.now()));
                        // });
                        Navigator.pop(context);
                      },
                      child: const Text("Save")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
