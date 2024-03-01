import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_mealplanning/Screens/add_recipe_screen.dart';
import 'package:recipe_mealplanning/Screens/recipe_detail_screen.dart';
import 'package:recipe_mealplanning/recipe_model.dart';
import 'package:recipe_mealplanning/recipe_provider.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
            trailing: IconButton(
              icon: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: recipe.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                Provider.of<RecipeProvider>(context, listen: false)
                    .toggleFavoriteStatus(recipe.id);
              },
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => RecipeDetailScreen(recipe: recipe)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddRecipeScreen()),
        ),
        child: Icon(Icons.add),
        tooltip: 'Add Recipe',
      ),
    );
  }
}
