import 'package:app_one/providiers/favourite_providier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

AnimationController? _animated;

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, ref) {
    var favMeal = ref.watch(favouriteMealProvidier);
    var isExist = favMeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: meal.title, child: Text(meal.title)),
        actions: [
          IconButton(
              icon: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Icon(
                      color: Colors.amber,
                      key: ValueKey(isExist),
                      isExist ? Icons.favorite : Icons.favorite_outline_sharp)),
              onPressed: () => ref
                  .read(favouriteMealProvidier.notifier)
                  .toggleFavorite(meal))
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "ingredients",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          for (final e in meal.ingredients) Center(child: Text(e)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Steps",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          for (final e in meal.steps)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                e,
                textAlign: TextAlign.center,
              )),
            ),
        ],
      ),
    );
  }
}
