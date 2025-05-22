import 'package:bitewise/core/theme/app_theme.dart'; // Certifique-se que AppTheme está definido aqui
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(String screenKey) onNavigate;

  const AppDrawer({super.key, required this.onNavigate});

  void _navigateTo(BuildContext context, String screenKey) {
    // 1. Fecha o Drawer imediatamente.
    // O Navigator.pop(context) é síncrono em termos de iniciar a animação de saída.
    Navigator.pop(context);

    // 2. Adia a chamada de onNavigate para após o frame atual.
    // Isso garante que a animação de fechamento do drawer seja processada
    // antes de qualquer trabalho potencialmente pesado em onNavigate,
    // melhorando a percepção de fluidez (INP).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Verifica se o widget ainda está montado antes de chamar o callback.
      if (context.mounted) {
        onNavigate(screenKey); // Navega para a tela desejada
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Estilo de texto predefinido para os itens, reutilizável e constante.
    // Considerar adicionar uma cor se desejar que o texto e o ícone tenham a mesma cor base.
    final TextStyle itemStyle = TextStyle(
      fontSize: 16,
      color: AppTheme.preto.withOpacity(0.87),
    ); // Exemplo de cor

    // Cor para os ícones, para consistência.
    final Color iconColor = AppTheme.vermelhoTomate.withOpacity(0.9);

    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero, // Removido, pois DrawerHeader geralmente lida com o topo.
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppTheme.vermelhoTomate),
            child: const Text(
              'Navegação', // Ou o nome do seu App
              style: TextStyle(color: AppTheme.branco, fontSize: 24),
            ),
          ),
          // Usar Builder para garantir que o context passado para _navigateTo
          // seja o correto para fechar o Drawer.
          Builder(
            builder: (BuildContext innerContext) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(
                    innerContext, // Use o context do Builder
                    Icons.home_outlined, // Ícone para Planos
                    'Planos',
                    'home',
                    itemStyle,
                    iconColor,
                  ),
                  _buildNavItem(
                    innerContext,
                    Icons.info_outline, // Ícone para Sobre nós
                    'Sobre nós',
                    'sobre-nos',
                    itemStyle,
                    iconColor,
                  ),
                  _buildNavItem(
                    innerContext,
                    Icons.help_outline, // Ícone para Contato e FAQ
                    'Contato e FAQ',
                    'contato',
                    itemStyle,
                    iconColor,
                  ),
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                  ), // Adiciona margem ao divisor
                  _buildNavItem(
                    innerContext,
                    Icons.login, // Ícone para Login
                    'Login',
                    'login',
                    itemStyle,
                    iconColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      24.0,
                      16.0,
                      16.0,
                    ), // Ajuste de padding
                    child: _buildRegisterButton(
                      innerContext,
                    ), // Use o context do Builder
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, // Context para _navigateTo
    IconData icon,
    String title,
    String screenKey,
    TextStyle style,
    Color iconColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 24), // Ícone adicionado
      title: Text(title, style: style),
      onTap: () => _navigateTo(context, screenKey),
      dense: true, // Torna o ListTile um pouco mais compacto
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    // Context para _navigateTo
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.laranjaMel,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ), // Raio de borda sutil
        ),
        minimumSize: const Size(
          double.infinity,
          48,
        ), // Altura aumentada para melhor toque
        elevation: 2, // Pequena elevação para destaque
      ),
      onPressed: () => _navigateTo(context, 'register'),
      child: const Text(
        'Começar gratuitamente',
        style: TextStyle(
          fontSize: 16,
          color:
              AppTheme
                  .preto, // Certifique-se que AppTheme.preto tem bom contraste
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
