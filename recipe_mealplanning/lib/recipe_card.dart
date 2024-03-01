import 'package:flutter/material.dart';
import 'recipe_model.dart';

// Assuming RecipeCard is a StatelessWidget that takes a Recipe object
class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onFavoriteToggle; // Callback for toggling favorite

  const RecipeCard(
      {Key? key, required this.recipe, required this.onFavoriteToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.name),
        trailing: IconButton(
          icon:
              Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border),
          color: recipe.isFavorite ? Colors.red : null,
          onPressed: onFavoriteToggle, // Use the provided callback here
        ),
        // Include other details like subtitle or leading widget as per your design
      ),
    );
  }
}
