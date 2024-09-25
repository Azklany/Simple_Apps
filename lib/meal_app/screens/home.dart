import 'package:app_one/meal_app/screens/categories_screen.dart';
import 'package:app_one/meal_app/screens/meals_screen.dart';
import 'package:app_one/providiers/favourite_providier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Meal> favMealProvider = ref.watch(favouriteMealProvidier);

    List<Widget> pages = [
      const CategoriesScreen(),
      MealsScreen(
        meals: favMealProvider,
        title: "Favorites",
      )
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categoies"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: "Favorites")
        ],
        currentIndex: index,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        selectedItemColor: Theme.of(context).colorScheme.onTertiaryContainer,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: (value) => setState(() {
          index = value;
        }),
      ),
      body: pages[index],
    );
  }
}
