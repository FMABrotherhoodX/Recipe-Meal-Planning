import 'package:flutter/material.dart';
import 'recipe_model.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => [..._recipes];

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void deleteRecipe(String id) {
    _recipes.removeWhere((rec) => rec.id == id);
    notifyListeners();
  }
}
