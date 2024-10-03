import 'package:app_one/meal_app/data/dummy_data.dart';
import 'package:app_one/meal_app/screens/drawer.dart';
import 'package:app_one/meal_app/screens/meals_screen.dart';
import 'package:flutter/material.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cateogry"),
      ),
      drawer: const DrawerScreen(),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        children: [
          for (final category in availableCategories)
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MealsScreen(
                        title: category.title,
                        meals: dummyMeals
                            .where((e) => e.categories.contains(category.id))
                            .toList(),
                      ))),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: category.color,
                    gradient: LinearGradient(colors: [
                      category.color,
                      category.color.withOpacity(.6)
                    ])),
                child: Center(
                    child: Hero(
                  tag: category.title,
                  child: Text(
                    category.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            )
        ],
      ),
    );
  }
}
