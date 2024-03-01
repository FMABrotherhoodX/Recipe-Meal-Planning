class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;
  final String instructions;
  final List<String> dietarySpecfications;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.dietarySpecfications,
  });
}
