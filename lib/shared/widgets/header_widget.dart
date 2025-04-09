import 'package:flutter/material.dart';
import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/custom_link.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.vermelhoTomate),
      child: Row(
        spacing: 120,
        children: [
          // Logo alinhado à esquerda
          Container(
            margin: const EdgeInsets.only(left: 100),
            child: Image.asset('images/LOGO.png', width: 100, height: 100),
          ),

          // Links centrais
          Row(
            children: [
              CustomLink(
                text: 'Planos',
                url: '/',
                underline: false,
                style: TextStyle(
                  color: AppTheme.branco,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 30), // Espaçamento entre os links
              CustomLink(
                text: 'Sobre nós',
                url: '/sobre',
                underline: false,
                style: TextStyle(
                  color: AppTheme.branco,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 30),
              CustomLink(
                text: 'contato e FAQ',
                url: '/contato',
                underline: false,
                style: TextStyle(
                  color: AppTheme.branco,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          // Espaço entre os links centrais e os links da direita
          const Spacer(),

          // Links da direita
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                CustomLink(
                  text: 'Login',
                  url: '/login',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.laranjaMel,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                  child: Text(
                    'Começar gratuitamente',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: AppTheme.preto,
                    ),
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
