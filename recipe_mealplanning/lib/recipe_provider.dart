import 'package:flutter/material.dart';
import 'recipe_model.dart'; // Make sure this import path is correct for your project structure

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<MealPlanFolder> _folders = [];
  List<Recipe> get favoriteRecipes =>
      _recipes.where((recipe) => recipe.isFavorite).toList();

  RecipeProvider() {
    _addPreExistingRecipes();
  }

  List<Recipe> get recipes => [..._recipes];
  List<MealPlanFolder> get folders => [..._folders];

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

  void addFolder(String folderName) {
    final newFolder = MealPlanFolder(
        id: DateTime.now().toString(), name: folderName, recipes: []);
    _folders.add(newFolder);
    notifyListeners();
  }

  void deleteFolder(String folderId) {
    _folders.removeWhere((folder) => folder.id == folderId);
    notifyListeners();
  }

  void addRecipeToFolder(String folderId, Recipe recipe) {
    final folderIndex = _folders.indexWhere((folder) => folder.id == folderId);
    if (folderIndex != -1) {
      _folders[folderIndex].recipes.add(recipe);
      notifyListeners();
    }
  }

  void removeRecipeFromFolder(String folderId, String recipeId) {
    final folderIndex = _folders.indexWhere((folder) => folder.id == folderId);
    if (folderIndex != -1) {
      _folders[folderIndex]
          .recipes
          .removeWhere((recipe) => recipe.id == recipeId);
      notifyListeners();
    }
  }
}
