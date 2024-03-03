import 'package:flutter/material.dart';
import 'recipe_model.dart'; // Make sure this import path is correct for your project structure

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];

  RecipeProvider() {
    _addPreExistingRecipes();
  }

  List<Recipe> get recipes => [..._recipes];

  List<Recipe> get favoriteRecipes =>
      _recipes.where((recipe) => recipe.isFavorite).toList();

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void deleteRecipe(String id) {
    _recipes.removeWhere((recipe) => recipe.id == id);
    notifyListeners();
  }

  void toggleFavoriteStatus(String id) {
    int index = _recipes.indexWhere((recipe) => recipe.id == id);
    if (index != -1) {
      _recipes[index].isFavorite = !_recipes[index].isFavorite;
      notifyListeners();
    }
  }

  void _addPreExistingRecipes() {
    _recipes.addAll([
      Recipe(
        id: '1',
        name: 'Pizza',
        description: 'Simple, Fasy, and Easy',
        ingredients: ['Tomato Sauce', 'Garlic', 'Dough', 'Parmesan Cheese'],
        imagePath: 'Assets/Pizza.jpg',
        isFavorite: false,
      ),
      Recipe(
        id: '2',
        name: 'Classic Tomato Soup',
        description: 'Warm and comforting tomato soup.',
        ingredients: ['Tomatoes', 'Onion', 'Garlic', 'Basil', 'Cream'],
        imagePath: 'Assets/tomato_soup.jpg',
        isFavorite: false,
      ),
    ]);
    notifyListeners();
  }
}
