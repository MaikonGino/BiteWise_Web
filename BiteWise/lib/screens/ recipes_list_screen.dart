import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final String prepTime;
  final String difficulty;
  final double rating;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.prepTime,
    required this.difficulty,
    required this.rating,
  });
}

class RecipesListScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      id: '1',
      title: 'Pão de Queijo Caseiro',
      imageUrl: 'assets/recipe1.jpg',
      prepTime: '45 min',
      difficulty: 'Fácil',
      rating: 4.8,
    ),
    Recipe(
      id: '2',
      title: 'Risotto de Cogumelos',
      imageUrl: 'assets/recipe2.jpg',
      prepTime: '30 min',
      difficulty: 'Médio',
      rating: 4.5,
    ),
    Recipe(
      id: '3',
      title: 'Salada Caesar Fit',
      imageUrl: 'assets/recipe3.jpg',
      prepTime: '15 min',
      difficulty: 'Fácil',
      rating: 4.7,
    ),
  ];

  RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      appBar: AppBar(
        title: const Text(
          'Receitas Geradas',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF333333),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Filtros
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    icon: const Icon(Icons.filter_list, size: 18, color: Color(0xFF666666)),
                    label: const Text(
                      'Filtrar',
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    icon: const Icon(Icons.sort, size: 18, color: Color(0xFF666666)),
                    label: const Text(
                      'Ordenar',
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Lista de Receitas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return _buildRecipeCard(recipe, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RecipeDetailScreen(recipe: recipe),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem da Receita
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF39C12).withOpacity(0.1),
                    image: DecorationImage(
                      image: AssetImage(recipe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Informações da Receita
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                          fontFamily: 'Poppins',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Color(0xFF666666)),
                          const SizedBox(width: 4),
                          Text(
                            recipe.prepTime,
                            style: const TextStyle(color: Color(0xFF666666), fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: _getDifficultyColor(recipe.difficulty),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              recipe.difficulty,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Color(0xFFF39C12)),
                          const SizedBox(width: 4),
                          Text(
                            recipe.rating.toString(),
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(Icons.favorite_border, size: 20, color: Color(0xFF666666)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'fácil':
        return const Color(0xFF66CDAA);
      case 'médio':
        return const Color(0xFFF39C12);
      case 'difícil':
        return const Color(0xFFC0392B);
      default:
        return const Color(0xFF666666);
    }
  }
}