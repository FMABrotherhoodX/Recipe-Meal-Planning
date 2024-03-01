import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';
import 'favorite_screen.dart';
import 'meal_plan_screen.dart';
import 'shopping_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
            const RecipeListScreen(),
            FavoriteScreen(),
            MealPlanScreen(),
            ShoppingListScreen(),
          ],
        ),
      ),
    );
  }
}
