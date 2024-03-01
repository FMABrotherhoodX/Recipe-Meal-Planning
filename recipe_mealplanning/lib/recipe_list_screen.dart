import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_model.dart';
import 'recipe_provider.dart';
import 'recipe_card.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(),
    );
  }
}
