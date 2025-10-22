import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5), // Bege Claro como fundo
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Logo do BiteWise conforme documentação
              height: 32,
              width: 32,
            ),
            const SizedBox(width: 12),
            const Text(
              'BiteWise',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF117A65), // Verde Mar Profundo
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFFD35400)), // Laranja-Paprika
            tooltip: 'Perfil',
            onPressed: () {
              // Navegar para tela de perfil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF117A65).withOpacity(0.9), // Verde Mar Profundo
                    const Color(0xFF66CDAA), // Verde Erva-Doce
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'A sua receita perfeita\nem instantes!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Use o que você já tem em casa e descubra receitas incríveis com IA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Card de Input de Ingredientes
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const IngredientsInputWidget(),
                  ),
                ],
              ),
            ),

            // COMO FUNCIONA SECTION
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'Como o BiteWise funciona?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF117A65), // Verde Mar Profundo
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Três passos simples para transformar seus ingredientes em receitas incríveis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStep(
                        number: 1,
                        icon: Icons.edit_note,
                        title: 'Digite\ningredientes',
                        color: Color(0xFFF39C12), // Laranja-Mel
                      ),
                      _buildStep(
                        number: 2,
                        icon: Icons.auto_awesome,
                        title: 'IA gera\nreceitas',
                        color: Color(0xFFD35400), // Laranja-Paprika
                      ),
                      _buildStep(
                        number: 3,
                        icon: Icons.restaurant,
                        title: 'Cozinhe e\naproveite',
                        color: Color(0xFFC0392B), // Vermelho-Tomate
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // BENEFÍCIOS SECTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              color: const Color(0xFFF8F9FA),
              child: Column(
                children: [
                  const Text(
                    'Menos tempo, mais sabor!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF117A65), // Verde Mar Profundo
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildBenefitCard(
                    icon: Icons.timer_outlined,
                    title: 'Praticidade',
                    description: 'Receitas em segundos, mais tempo com quem você ama.',
                    color: Color(0xFF66CDAA), // Verde Erva-Doce
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitCard(
                    icon: Icons.kitchen_outlined,
                    title: 'Ingredientes',
                    description: 'Use ao máximo o que você tem. Sem desperdício.',
                    color: Color(0xFF117A65), // Verde Mar Profundo
                  ),
                  const SizedBox(height: 20),
                  _buildBenefitCard(
                    icon: Icons.savings_outlined,
                    title: 'Economia',
                    description: 'Reduza desperdícios e economize no seu orçamento.',
                    color: Color(0xFFF39C12), // Laranja-Mel
                  ),
                ],
              ),
            ),

            // OFERTA SECTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFD35400), // Laranja-Paprika
                      const Color(0xFFF39C12), // Laranja-Mel
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD35400).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Oferta Especial',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '2 meses grátis* + 16% de desconto no plano anual',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFD35400),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'ASSINAR AGORA',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Receitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: const Color(0xFFD35400), // Laranja-Paprika
          unselectedItemColor: const Color(0xFFB1B4B5), // Cinza Nuvem
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildStep({required int number, required IconData icon, required String title, required Color color}) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    fontFamily: 'Poppins',
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          'Digite seus ingredientes separados por vírgula:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _ingredientsController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Ex: frango, arroz, cebola, tomate, alho...',
            hintStyle: const TextStyle(color: Color(0xFFB1B4B5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD35400)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
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
              backgroundColor: const Color(0xFFD35400), // Laranja-Paprika
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: const Text(
              'GERAR RECEITAS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        if (_message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              _message,
              style: const TextStyle(
                color: Color(0xFF117A65),
                fontFamily: 'Poppins',
              ),
            ),
          ),
      ],
    );
  }
}