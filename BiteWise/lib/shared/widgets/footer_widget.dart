import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/custom_link.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 430,
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.verdeMarProfundo),
      child: _buildFooterSectionRow(context),
    );
  }

  Widget _buildFooterSectionRow(BuildContext context) {
    return Row(
      children: [
        _buildLeftSectionContent(),
        _buildMidSectionContent(context),
        _buildRightSectionContent(context),
      ],
    );
  }

  Widget _buildLeftSectionContent() {
    return FooterSection(
      sectionWidth: 370,
      sectionContent: [
        Row(
          spacing: 20,
          children: [
            Image.asset('images/LOGO.png', height: 100, width: 100),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '© 2025 BiteWise.',
                  style: TextStyle(color: AppTheme.branco, fontSize: 18),
                ),
                Text(
                  'Todos os direitos reservados.',
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _leftSectionTopic('Produto', [
                CustomLink(
                  text: 'Planos e Assinaturas',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                CustomLink(
                  text: 'FAQ',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ]),
              _leftSectionTopic('Sobre nós', [
                CustomLink(
                  text: 'Sobre o BiteWise',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                CustomLink(
                  text: 'Contato e Suporte',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ]),
              _leftSectionTopic('Condições', [
                CustomLink(
                  text: 'Política de privacidade',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                CustomLink(
                  text: 'Termos de Uso',
                  url: '',
                  underline: false,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: AppTheme.branco,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
      hasBorder: true,
    );
  }

  Widget _leftSectionTopic(String topicTitle, List<CustomLink> topicOptions) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topicTitle,
          style: TextStyle(
            color: AppTheme.preto,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        ...topicOptions,
      ],
    );
  }

  Widget _buildMidSectionContent(BuildContext context) {
    return FooterSection(
      sectionWidth: 600,
      sectionContent: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Image.asset('images/LOGO.png', height: 200, width: 200),
            Text(
              'Experimente grátis ou escolha entre os planos e aproveite receitas personalizadas e muito mais!',
              style: TextStyle(
                color: AppTheme.branco,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Plano Anual com 2 MESES GRÁTIS!',
              style: TextStyle(
                color: AppTheme.branco,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 50,
              width: 230,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppTheme.laranjaMel,
                ),
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text(
                  'Escolha e Economize',
                  style: TextStyle(
                    color: AppTheme.preto,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      hasBorder: true,
    );
  }

  Widget _buildRightSectionContent(BuildContext context) {
    return FooterSection(
      sectionWidth: 300,
      sectionContent: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Encontre-nos',
                style: TextStyle(
                  color: AppTheme.branco,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  spacing: 45,
                  children: [
                    _buildSocialMediaButton(
                      'images/TIKTOK.png',
                      'TikTok',
                      'https://www.tiktok.com/login?lang=pt-BR&redirect_url=https%3A%2F%2Fwww.tiktok.com%2Fupload%3Flang%3Dpt-BR',
                      context,
                    ),
                    _buildSocialMediaButton(
                      'images/INSTAGRAM.png',
                      'Instagram',
                      'https://www.instagram.com/',
                      context,
                    ),
                    _buildSocialMediaButton(
                      'images/TWITTER.png',
                      'X / Twitter',
                      'https://x.com/?lang=pt',
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      hasBorder: false,
    );
  }

  Widget _buildSocialMediaButton(
    String imagePath,
    String name,
    String url,
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 30,
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, url),
          child: Image.asset(imagePath, height: 70, width: 70),
        ),
        CustomLink(
          text: name,
          url: url,
          underline: false,
          style: TextStyle(
            color: AppTheme.branco,
            fontSize: 16,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  final double sectionWidth;
  final List<Widget> sectionContent;
  final bool hasBorder;

  const FooterSection({
    super.key,
    required this.sectionWidth,
    required this.sectionContent,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            hasBorder
                ? Border(
                  right: BorderSide(
                    width: 1,
                    color: Color(0xFFE5E7E9).withValues(alpha: 0.75),
                  ),
                )
                : null,
      ),
      width: sectionWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...sectionContent],
      ),
    );
  }
}
