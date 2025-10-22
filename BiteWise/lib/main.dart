import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/recipes_list_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/saved_recipes_screen.dart';
import 'models/recipe_models.dart';

void main() {
  runApp(const BiteWiseApp());
}

class BiteWiseApp extends StatelessWidget {
  const BiteWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/recipes': (context) => const RecipesListScreen(),
        '/recipe_detail': (context) => const RecipeDetailScreen(recipe: Recipe(
          id: '1',
          title: 'Receita',
          imageUrl: 'assets/recipe1.jpg',
          prepTime: '0 min',
          difficulty: 'Fácil',
          rating: 4.0,
        )),
        '/profile': (context) => ProfileScreen(),
        '/saved': (context) => SavedRecipesScreen(),
      },
    );
  }
}
