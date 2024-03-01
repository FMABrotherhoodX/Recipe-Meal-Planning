import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';
import 'Favorite_Screen.dart';
import 'MealPlan.dart';
import 'ShoppingListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Recipes'),
            Tab(text: 'Favorites'),
            Tab(text: 'Meal Plan'),
            Tab(text: 'Shopping List'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          RecipeListScreen(),
          FavoriteScreen(),
          MealPlanScreen(),
          ShoppingListScreen(),
        ],
      ),
    );
  }
}
