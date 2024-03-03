import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_mealplanning/folder_detail_screen.dart';
import 'package:recipe_mealplanning/recipe_provider.dart';

class MealPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);
    final folders = provider.folders;

    void _addFolder() async {
      final folderName = await _showAddFolderDialog(context);
      if (folderName != null) {
        provider.addFolder(folderName);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Meal Plans')),
      body: ListView.builder(
        itemCount: folders.length,
        itemBuilder: (context, index) {
          final folder = folders[index];
          return ListTile(
            title: Text(folder.name),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FolderDetailScreen(folder: folder)));
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => provider.deleteFolder(folder.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFolder,
        child: Icon(Icons.add),
        tooltip: 'Add Folder',
      ),
    );
  }

  Future<String?> _showAddFolderDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New Folder'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Folder Name'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: Text('Add')),
        ],
      ),
    );
  }
}
