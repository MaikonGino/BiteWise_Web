import 'package:flutter/material.dart';
import '../models/recipe_models.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: const Color(0xFF117A65),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF333333),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildMetadata(Icons.timer, recipe.prepTime),
                      const SizedBox(width: 20),
                      _buildMetadata(Icons.people, '4 porções'),
                      const SizedBox(width: 20),
                      _buildMetadata(Icons.star, recipe.rating.toString()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: _getDifficultyColor(recipe.difficulty).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _getDifficultyColor(recipe.difficulty)),
                    ),
                    child: Text(
                      'Dificuldade: ${recipe.difficulty}',
                      style: TextStyle(
                        color: _getDifficultyColor(recipe.difficulty),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildIngredientItem('2 xícaras de polvilho doce'),
                  _buildIngredientItem('1 xícara de leite'),
                  _buildIngredientItem('1/2 xícara de óleo'),
                  _buildIngredientItem('2 ovos'),
                  _buildIngredientItem('100g de queijo parmesão ralado'),
                  _buildIngredientItem('Sal a gosto'),
                  const SizedBox(height: 32),
                  const Text(
                    'Modo de Preparo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStepItem(1, 'Preaqueça o forno a 180°C.'),
                  _buildStepItem(2, 'Em uma panela, ferva o leite com o óleo e o sal.'),
                  _buildStepItem(3, 'Despeje sobre o polvilho e misture bem.'),
                  _buildStepItem(4, 'Deixe esfriar e acrescente os ovos e o queijo.'),
                  _buildStepItem(5, 'Modele os pães e asse por 25-30 minutos.'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: const Color(0xFFD35400),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.shopping_basket),
          label: const Text(
            'ADICIONAR INGREDIENTES FALTANTES À LISTA',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildMetadata(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF666666)),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(String ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFFD35400),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              ingredient,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(int step, String instruction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF117A65),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              instruction,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontFamily: 'Poppins',
                height: 1.4,
              ),
            ),
          ),
        ],
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
