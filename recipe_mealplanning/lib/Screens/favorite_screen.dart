import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_mealplanning/recipe_card.dart';
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
        itemBuilder: (context, index) => RecipeCard(
          recipe: favoriteRecipes[index],
          onFavoriteToggle: () {},
        ),
      ),
    );
  }
}
