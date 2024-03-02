import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_mealplanning/Screens/recipe_detail_screen.dart';
import 'package:recipe_mealplanning/recipe_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteRecipes =
        Provider.of<RecipeProvider>(context).favoriteRecipes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return ListTile(
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<RecipeProvider>(context, listen: false)
                    .toggleFavoriteStatus(recipe.id);
              },
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RecipeDetailScreen(
                    recipe:
                        recipe), // Make sure you have this screen to show recipe details
              ),
            ),
          );
        },
      ),
    );
  }
}
