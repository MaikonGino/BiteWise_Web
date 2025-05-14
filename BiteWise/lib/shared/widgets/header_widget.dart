import 'package:flutter/material.dart';
import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/custom_link.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(String screenkey) onNavigate;

  const HeaderWidget({super.key, required this.onNavigate});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      color: AppTheme.vermelhoTomate,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          spacing: 120,
          children: [
            // Logo alinhado à esquerda
            Container(
              margin: const EdgeInsets.only(left: 100),
              child: SvgPicture.asset(
                'images/shared/LOGO.svg',
                width: 150,
                height: 150,
              ),
            ),

            // Links centrais
            Row(
              spacing: 30,
              children: [
                CustomLink(
                  text: 'Planos',
                  url: '/',
                  onTap: () => onNavigate('home'),
                  hasUnderline: false,
                  style: TextStyle(color: AppTheme.branco, fontSize: 16),
                ),

                CustomLink(
                  text: 'Sobre nós',
                  url: '/sobre-nos',
                  onTap: () => onNavigate('sobre-nos'),
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),

                CustomLink(
                  text: 'contato e FAQ',
                  url: '/contato',
                  onTap: () => onNavigate('contato'),
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
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
                spacing: 20,
                children: [
                  CustomLink(
                    text: 'Login',
                    url: '/login',
                    onTap: () => onNavigate('login'),
                    hasUnderline: false,
                    style: TextStyle(
                      color: AppTheme.branco,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.laranjaMel,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => onNavigate('register'),
                    child: Text(
                      'Começar gratuitamente',
                      style: TextStyle(fontSize: 16, color: AppTheme.preto),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
