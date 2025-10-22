import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instância local para o logout
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BiteWise - Sua Receita Perfeita'),
        backgroundColor: const Color(0xFFD35400), // Laranja-Paprika
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Sair',
            onPressed: () async {
              await authService.logout();
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A sua receita perfeita em instantes!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC0392B)), // Vermelho-Tomate
            ),
            const SizedBox(height: 20),

            // Componente de Inserção de Ingredientes
            const IngredientsInputWidget(),

            const SizedBox(height: 40),

            const Text(
              'Menos tempo, mais sabor!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),

            _buildFeatureItem(
              icon: Icons.timer,
              title: 'Praticidade',
              subtitle: 'Receitas em segundos, mais tempo com quem você ama.',
            ),

            _buildFeatureItem(
              icon: Icons.kitchen,
              title: 'Ingredientes',
              subtitle: 'Use ao máximo o que você tem. Sem desperdício.',
            ),

            _buildFeatureItem(
              icon: Icons.star,
              title: 'Oferta',
              subtitle: '2 meses grátis* + 16% de desconto no plano anual.',
            ),
          ],
        ),
      ),
      // Barra de Navegação Inferior (Conforme Figma)
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Criar'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Receita'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Você'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFFD35400), // Laranja-Paprika
      ),
    );
  }

  // Widget para os itens de feature (Praticidade, Ingredientes, etc.)
  Widget _buildFeatureItem({required IconData icon, required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF117A65), size: 30), // Verde Mar Profundo
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget de Input de Ingredientes (A ser conectado ao RecipeService)
class IngredientsInputWidget extends StatefulWidget {
  const IngredientsInputWidget({super.key});

  @override
  State<IngredientsInputWidget> createState() => _IngredientsInputWidgetState();
}

class _IngredientsInputWidgetState extends State<IngredientsInputWidget> {
  final TextEditingController _ingredientsController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Digite aqui seus ingredientes, separados por vírgula.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _ingredientsController,
          decoration: InputDecoration(
            hintText: 'Ex: Frango, arroz, cebola...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implementar a chamada ao RecipeService aqui
              setState(() {
                _message = 'Ingredientes enviados: ${_ingredientsController.text}';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF39C12), // Laranja-Mel
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'COMEÇAR',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (_message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(_message, style: const TextStyle(color: Colors.blue)),
          ),
      ],
    );
  }
}