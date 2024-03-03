class Recipe {
  String id;
  String name;
  String description;
  List<String> ingredients;
  String imagePath;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.imagePath,
    this.isFavorite = false,
  });
}

class MealPlanFolder {
  String id;
  String name;
  List<Recipe> recipes;

  MealPlanFolder({
    required this.id,
    required this.name,
    required this.recipes,
  });
}
