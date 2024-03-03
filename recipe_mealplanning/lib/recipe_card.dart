import 'package:flutter/material.dart';
import 'recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onFavoriteToggle;

  const RecipeCard(
      {Key? key, required this.recipe, required this.onFavoriteToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
          ),
          if (recipe.imagePath.isNotEmpty)
            Image.asset(
              recipe.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}
