import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_mealplanning/Screens/add_recipe_screen.dart';
import 'package:recipe_mealplanning/Screens/recipe_detail_screen.dart';
import '../recipe_model.dart';
import '../recipe_provider.dart';
import '../recipe_card.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = Provider.of<RecipeProvider>(context)
        .recipes; // This listens for changes

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
            child: RecipeCard(recipe: recipe),
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
