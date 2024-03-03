import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_provider.dart';
import 'select_recipe_screen.dart';
import 'recipe_model.dart';

class FolderDetailScreen extends StatelessWidget {
  final MealPlanFolder folder;

  FolderDetailScreen({required this.folder});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);

    void _navigateAndAddRecipe() async {
      final Recipe? selectedRecipe = await Navigator.push<Recipe?>(
        context,
        MaterialPageRoute(builder: (context) => SelectRecipeScreen()),
      );

      if (selectedRecipe != null) {
        provider.addRecipeToFolder(folder.id, selectedRecipe);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name),
      ),
      body: ListView.builder(
        itemCount: folder.recipes.length,
        itemBuilder: (context, index) {
          final recipe = folder.recipes[index];
          return ListTile(
            title: Text(recipe.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () =>
                  provider.removeRecipeFromFolder(folder.id, recipe.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddRecipe,
        child: Icon(Icons.add),
        tooltip: 'Add Recipe to Folder',
      ),
    );
  }
}
