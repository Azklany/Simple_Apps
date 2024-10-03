import 'dart:convert';

import 'package:app_one/shop_app/data/categories.dart';
import 'package:app_one/shop_app/models/category.dart';
import 'package:app_one/shop_app/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

final formKey = GlobalKey<FormState>();
// ignore: prefer_typing_uninitialized_variables
var eName = '';

// ignore: prefer_typing_uninitialized_variables
int eQuantity = 0;

var eCategory = categories[Categories.fruit];

class _NewItemState extends State<NewItem> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    eName = newValue!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name must be more than 1 char";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onSaved: (newValue) {
                          eQuantity = int.parse(newValue!);
                        },
                        keyboardType: TextInputType.number,
                        initialValue: "1",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Quantiiy",
                        ),
                        validator: (value) {
                          if (value == null ||
                              int.tryParse(value)! <= 0 ||
                              value.isEmpty) {
                            return "Name must be more than 1 char";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: DropdownButtonFormField(
                      value: eCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(category.value.name),
                                ],
                              ))
                      ],
                      onChanged: (value) {
                        setState(() {
                          eCategory = value;
                        });
                      },
                    )),
                    const SizedBox(height: 5),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed:isLoading? null : () {
                          formKey.currentState!.reset();
                        },
                        child: const Text("reset")),
                    ElevatedButton(
                        onPressed:isLoading? null: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            setState(() {
                              isLoading = true;
                            });
                            Uri url = Uri.parse(
                                "https://flutter-test-469ab-default-rtdb.firebaseio.com/shopping.json");
                            http.Response res = await http.post(url,
                                headers: {"Content-Type": "application/json"},
                                body: json.encode({
                                  "name": eName,
                                  "quantity": eQuantity,
                                  "category": eCategory!.name
                                }));
                            if (res.statusCode == 200) {
                              // log(res.body);
                              final resss = json.decode(res.body);
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop(GroceryItem(
                                  id: resss["name"],
                                  name: eName,
                                  quantity: eQuantity,
                                  category: eCategory!));
                            }
                          }
                        },
                        child: isLoading? const SizedBox(height: 16,width: 16,child: CircularProgressIndicator()): const Text("Add Item"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
