import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_provider.dart'; // Adjust the import path as necessary
import 'recipe_model.dart'; // Adjust the import path as necessary

class SelectRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<RecipeProvider>(context).recipes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Recipe'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            onTap: () => Navigator.pop(context, recipe),
          );
        },
      ),
    );
  }
}