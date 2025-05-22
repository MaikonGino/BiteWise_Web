import 'package:bitewise/core/theme/app_theme.dart'; // Presumindo que AppTheme está aqui
import 'package:bitewise/shared/widgets/custom_link.dart'; // Presumindo que CustomLink está aqui
import 'package:flutter/material.dart';
// Para links externos, considere usar o pacote url_launcher:
// import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  // Define um breakpoint para alternar entre layouts
  static const double _tabletBreakpoint = 768.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < _tabletBreakpoint;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isSmallScreen ? 30 : 20,
      ), // Padding vertical ajustado
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.verdeMarProfundo),
      child: _buildFooterLayout(context, isSmallScreen),
    );
  }

  Widget _buildFooterLayout(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      // Layout em Coluna para telas pequenas - SEM A SEÇÃO DO MEIO
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centraliza as seções na coluna
        children: [
          _buildLeftSectionContent(context, isSmallScreen),
          const SizedBox(
            height: 30,
          ), // Espaçador entre a seção esquerda e direita
          _buildRightSectionContent(context, isSmallScreen),
        ],
      );
    } else {
      // Layout em Linha para telas maiores - COM TODAS AS SEÇÕES
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3, // Ajuste os fatores flex conforme necessário
            child: _buildLeftSectionContent(context, isSmallScreen),
          ),
          Expanded(
            flex: 4, // Ajuste os fatores flex conforme necessário
            child: _buildMidSectionContent(context, isSmallScreen),
          ),
          Expanded(
            flex: 2, // Ajuste os fatores flex conforme necessário
            child: _buildRightSectionContent(context, isSmallScreen),
          ),
        ],
      );
    }
  }

  Widget _buildLeftSectionContent(BuildContext context, bool isSmallScreen) {
    return FooterSection(
      isSmallScreen: isSmallScreen,
      // crossAxisAlignment: CrossAxisAlignment.start, // O padrão já é start para telas não pequenas
      sectionContent: [
        Row(
          mainAxisAlignment:
              isSmallScreen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/shared/LOGO.png',
              height: isSmallScreen ? 70 : 100,
              width: isSmallScreen ? 70 : 100,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '© 2025 BiteWise.',
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontSize: isSmallScreen ? 15 : 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Todos os direitos reservados.',
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontSize: isSmallScreen ? 10 : 12,
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
            crossAxisAlignment:
                isSmallScreen
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
            children: [
              _leftSectionTopic(context, 'Produto', [
                CustomLink(
                  text: 'Planos e Assinaturas',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
                CustomLink(
                  text: 'FAQ',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ], isSmallScreen),
              const SizedBox(height: 20),
              _leftSectionTopic(context, 'Sobre nós', [
                CustomLink(
                  text: 'Sobre o BiteWise',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
                CustomLink(
                  text: 'Contato e Suporte',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ], isSmallScreen),
              const SizedBox(height: 20),
              _leftSectionTopic(context, 'Condições', [
                CustomLink(
                  text: 'Política de privacidade',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    color: AppTheme.branco,
                    fontWeight: FontWeight.w200,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
                CustomLink(
                  text: 'Termos de Uso',
                  url: '', // Defina a URL apropriada
                  hasUnderline: false,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: AppTheme.branco,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ], isSmallScreen),
            ],
          ),
        ),
      ],
      hasBorder:
          true, // Borda lateral para telas grandes, borda inferior para pequenas se desejado
    );
  }

  Widget _leftSectionTopic(
    BuildContext context,
    String topicTitle,
    List<Widget> topicOptions,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          topicTitle,
          style: TextStyle(
            color:
                AppTheme
                    .branco, // Alterado de AppTheme.preto para melhor contraste
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.w800,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 8), // Espaçamento aumentado ligeiramente
        ...topicOptions.map(
          (option) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
            ), // Espaçamento entre links
            child: option,
          ),
        ),
      ],
    );
  }

  Widget _buildMidSectionContent(BuildContext context, bool isSmallScreen) {
    // Este widget não será exibido em telas pequenas devido à lógica em _buildFooterLayout
    return FooterSection(
      isSmallScreen: isSmallScreen,
      crossAxisAlignment: CrossAxisAlignment.center,
      sectionContent: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/shared/LOGO.png',
              height:
                  isSmallScreen
                      ? 120
                      : 200, // Ajustes aqui ainda são relevantes se um dia for exibido em tela pequena
              width: isSmallScreen ? 120 : 200,
            ),
            SizedBox(height: isSmallScreen ? 20 : 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16.0 : 0,
              ),
              child: Text(
                'Experimente grátis ou escolha entre os planos e aproveite receitas personalizadas e muito mais!',
                style: TextStyle(
                  color: AppTheme.branco,
                  fontWeight: FontWeight.w500,
                  fontSize: isSmallScreen ? 13 : 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: isSmallScreen ? 15 : 30),
            Text(
              'Plano Anual com 2 MESES GRÁTIS!',
              style: TextStyle(
                color: AppTheme.branco,
                fontWeight: FontWeight.w800,
                fontSize: isSmallScreen ? 15 : 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isSmallScreen ? 20 : 30),
            SizedBox(
              height: isSmallScreen ? 45 : 50,
              width: isSmallScreen ? 200 : 230,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppTheme.laranjaMel,
                ),
                onPressed:
                    () => Navigator.pushNamed(
                      context,
                      '/',
                    ), // Verifique se a rota '/' está correta
                child: Text(
                  'Escolha e Economize',
                  style: TextStyle(
                    color: AppTheme.preto,
                    fontWeight: FontWeight.w800,
                    fontSize: isSmallScreen ? 14 : 16,
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

  Widget _buildRightSectionContent(BuildContext context, bool isSmallScreen) {
    return FooterSection(
      isSmallScreen: isSmallScreen,
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      sectionContent: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 0 : 20,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment:
                isSmallScreen
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
            children: [
              Text(
                'Encontre-nos',
                style: TextStyle(
                  color: AppTheme.branco,
                  fontSize: isSmallScreen ? 18 : 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
              ),
              Padding(
                padding: EdgeInsets.only(top: isSmallScreen ? 30 : 50),
                child: Column(
                  children: [
                    _buildSocialMediaButton(
                      context,
                      'images/shared/TIKTOK.png',
                      'TikTok',
                      'https://www.tiktok.com/login?lang=pt-BR&redirect_url=https%3A%2F%2Fwww.tiktok.com%2Fupload%3Flang%3Dpt-BR',
                      isSmallScreen,
                    ),
                    SizedBox(
                      height: isSmallScreen ? 20 : 35,
                    ), // Espaçamento ajustado
                    _buildSocialMediaButton(
                      context,
                      'images/shared/INSTAGRAM.png',
                      'Instagram',
                      'https://www.instagram.com/',
                      isSmallScreen,
                    ),
                    SizedBox(
                      height: isSmallScreen ? 20 : 35,
                    ), // Espaçamento ajustado
                    _buildSocialMediaButton(
                      context,
                      'images/shared/TWITTER.png',
                      'X / Twitter',
                      'https://x.com/?lang=pt',
                      isSmallScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      hasBorder: false, // Originalmente false, mantido
    );
  }

  Widget _buildSocialMediaButton(
    BuildContext context,
    String imagePath,
    String name,
    String url,
    bool isSmallScreen,
  ) {
    // Para abrir links externos, use o pacote url_launcher:
    // Future<void> _launchUrl() async {
    //   if (!await launchUrl(Uri.parse(url))) {
    //     throw Exception('Could not launch $url');
    //   }
    // }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isSmallScreen ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        InkWell(
          // onTap: _launchUrl, // Use com url_launcher
          onTap: () {
            // Provisório: Navigator.pushNamed não é ideal para URLs externas.
            // Considere usar o pacote url_launcher.
            print('Tentando navegar para: $url');
            // Se url for uma rota interna: Navigator.pushNamed(context, url);
          },
          child: Image.asset(
            imagePath,
            height: isSmallScreen ? 40 : 60, // Tamanho ajustado
            width: isSmallScreen ? 40 : 60, // Tamanho ajustado
          ),
        ),
        SizedBox(width: isSmallScreen ? 15 : 20), // Espaçamento ajustado
        CustomLink(
          text: name,
          url: url, // CustomLink também pode usar url_launcher internamente
          hasUnderline: false,
          style: TextStyle(
            color: AppTheme.branco,
            fontSize: isSmallScreen ? 13 : 16,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  final List<Widget> sectionContent;
  final bool hasBorder;
  final bool isSmallScreen;
  final CrossAxisAlignment?
  crossAxisAlignment; // Para alinhar o conteúdo da coluna interna

  const FooterSection({
    super.key,
    required this.sectionContent,
    this.hasBorder = true,
    required this.isSmallScreen,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          isSmallScreen
              ? double.infinity
              : null, // Ocupa toda a largura em telas pequenas
      padding:
          isSmallScreen && hasBorder
              ? const EdgeInsets.only(bottom: 20)
              : EdgeInsets
                  .zero, // Adiciona padding inferior se houver borda em tela pequena
      decoration: BoxDecoration(
        border:
            !isSmallScreen && hasBorder
                ? Border(
                  right: BorderSide(
                    width: 1,
                    // Corrigido: .withAlpha espera um int de 0-255. (0.75 * 255).round() = 191
                    color: const Color(0xFFE5E7E9).withAlpha(191),
                  ),
                )
                : (isSmallScreen &&
                        hasBorder // Opcional: borda inferior em telas pequenas
                    ? Border(
                      bottom: BorderSide(
                        width: 1,
                        color: const Color(0xFFE5E7E9).withAlpha(191),
                      ),
                    )
                    : null),
      ),
      child: Column(
        // Define o alinhamento cruzado da coluna interna da seção
        crossAxisAlignment:
            crossAxisAlignment ??
            (isSmallScreen
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start),
        children: sectionContent,
      ),
    );
  }
}
