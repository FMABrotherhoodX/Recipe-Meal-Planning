import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/home_screen.dart';
import 'recipe_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => RecipeProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        title: 'Meal Planner',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
