import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../recipe_model.dart';
import '../recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final ingredientsController = TextEditingController();
  String imagePath = '';

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = Recipe(
        id: DateTime.now().toString(),
        name: nameController.text,
        description: descriptionController.text,
        ingredients:
            ingredientsController.text.split(',').map((e) => e.trim()).toList(),
        imagePath:
            imagePath, // This will need to be set when you implement image picking
      );
      Provider.of<RecipeProvider>(context, listen: false).addRecipe(newRecipe);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                TextFormField(
                  controller: ingredientsController,
                  decoration: InputDecoration(
                      labelText: 'Ingredients (comma separated)'),
                ),
                // Placeholder for image picker
                Text('Image picker placeholder'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
