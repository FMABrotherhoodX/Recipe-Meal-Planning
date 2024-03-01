class Recipe {
  final String id;
  final String name;
  final String description;
  final List<String> ingredients;
  final String imagePath;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.imagePath,
  });
}
