import 'package:app_one/meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  void toggleFavorite(Meal meal) {
    bool isSelected = state.contains(meal);
    if (isSelected) {
      state = state.where((e) => e.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealProvidier =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
  (ref) {
    return FavouriteMealNotifier();
  },
);
