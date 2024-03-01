import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecipeListScreen())),
          child: const Text('View Recipe'),
        ),
      ),
    );
  }
}
