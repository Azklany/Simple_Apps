import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  bool isVegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vegan: isVegan,
            Filter.vegetarian: isVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            switchList(
              context,
              "Gluten",
              "Sub title for Gluten type",
              isGlutenFree,
              (val) {
                setState(() {
                  isGlutenFree = val;
                });
              },
            ),
            switchList(
              context,
              "Lactose",
              "Sub title for Lactose type",
              isLactoseFree,
              (val) {
                setState(() {
                  isLactoseFree = val;
                });
              },
            ),
            switchList(
              context,
              "Vegetarian",
              "Sub title for Vegetarian type",
              isVegetarian,
              (val) {
                setState(() {
                  isVegetarian = val;
                });
              },
            ),
            switchList(
              context,
              "Vegan",
              "Sub title for Vegan type",
              isVegan,
              (val) {
                setState(() {
                  isVegan = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile switchList(context, title, subTitle, isClicked, onChange) {
    return SwitchListTile(
      value: isClicked,
      onChanged: onChange,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      activeColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.all(30),
    );
  }
}
