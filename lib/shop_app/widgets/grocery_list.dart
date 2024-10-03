import 'dart:convert';
import 'dart:developer';

import 'package:app_one/shop_app/data/categories.dart';
import 'package:app_one/shop_app/models/category.dart';
import 'package:app_one/shop_app/models/grocery_item.dart';
import 'package:app_one/shop_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  bool isLoading = true;
  List<GroceryItem> _groceryItems = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Uri url = Uri.parse(
        "https://flutter-test-469ab-default-rtdb.firebaseio.com/shopping.json");
    http.Response res = await http.get(url);
    log(res.body);
    if (res.body == 'null') {
      setState(() {
        isLoading = false;
      });
      return;
    }
    Map<String, dynamic> loadedData = json.decode(res.body);
    List<GroceryItem> loadedItems = [];
    for (var e in loadedData.entries) {
      Category cat = categories.entries
          .firstWhere((element) => element.value.name == e.value["category"])
          .value;
      loadedItems.add(GroceryItem(
          id: e.key,
          name: e.value["name"],
          quantity: e.value["quantity"],
          category: cat));
    }
    setState(() {
      _groceryItems = loadedItems;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No item add"),
    );

    if (isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            key: ValueKey(_groceryItems[index].id),
            onDismissed: (direction) {
              Uri url = Uri.parse(
                  "https://flutter-test-469ab-default-rtdb.firebaseio.com/shopping/${_groceryItems[index].id}.json");
              http.delete(url);
              setState(() {
                _groceryItems.remove(_groceryItems[index]);
              });
            },
            child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 16,
                height: 16,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text("${_groceryItems[index].quantity}"),
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Grocery"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const NewItem()))
                    .then((value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _groceryItems.add(value);
                  });
                });
              },
            )
          ],
        ),
        body: content);
  }
}
