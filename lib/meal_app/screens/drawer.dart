import 'package:app_one/meal_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

Map<Filter, bool> filterdMeals = {
  Filter.glutenFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
  Filter.lactoseFree: false,
};

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.fastfood_outlined,
                        size: 40,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Cooking UP ...",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24),
                      ),
                    ],
                  ),
                )),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.restaurant),
              title: Text("Meals",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const FilterScreen()))
                    .then(
                  (value) {
                    filterdMeals = value;
                  },
                );
              },
              leading: const Icon(Icons.settings),
              title: Text("Filters",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
