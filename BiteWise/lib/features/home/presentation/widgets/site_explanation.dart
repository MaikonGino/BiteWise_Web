import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SiteExplanationWidget extends StatelessWidget {
  const SiteExplanationWidget({super.key});

  static final List<Widget> explanationSteps = [
    const SiteExplanationStep(
      imagePath: 'images/home/PASSO-01.webp',
      title: 'Passo 01',
      description:
          'Digite seus ingredientes. Encontre receitas que combinam perfeitamente com o que você tem.',
    ),
    const SiteExplanationStep(
      imagePath: 'images/home/PASSO-02.webp',
      title: 'Passo 02',
      description:
          'Descubra uma receita com os seus ingredientes de casa! Prepare-se para cozinhar uma refeição deliciosa.',
    ),
    const SiteExplanationStep(
      imagePath: 'images/home/PASSO-03.webp',
      title: 'Passo 03',
      description:
          'Siga os passos da receita. Desfrute do seu prato feito em casa, e com a orientação do BiteWise.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen =
        screenWidth < 768; // Breakpoint para mudar de Wrap para Column

    // Padding horizontal responsivo
    final double horizontalPagePadding = (screenWidth * 0.05).clamp(
      16.0,
      100.0,
    );

    // Tamanho da fonte do título da seção
    final double sectionTitleFontSize = isSmallScreen ? 26.0 : 34.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPagePadding,
      ), // Adicionado padding vertical
      width: screenWidth, // Ocupa toda a largura disponível
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinha o título à esquerda
        children: [
          // Título da Seção
          _buildSectionTitle(context, sectionTitleFontSize),

          // Layout dos Passos (Wrap para telas grandes, Column para pequenas)
          Center(
            child: _buildStepsLayout(
              context,
              isSmallScreen,
              screenWidth,
              explanationSteps,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, double sectionTitleFontSize) {
    final sectionTitleStyle = TextStyle(
      fontSize: sectionTitleFontSize,
      fontWeight: FontWeight.w700,
    );
    // Supondo _sectionBorderColor como static const Color
    const sectionBorderColor = AppTheme.preto025;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: sectionBorderColor, width: 1),
        ),
      ),
      child: Text('Como o BiteWise funciona?', style: sectionTitleStyle),
    );
  }

  Widget _buildStepsLayout(
    BuildContext context,
    bool isSmallScreen,
    double screenWidth,
    List<Widget> steps,
  ) {
    if (isSmallScreen) {
      final double columnItemWidth = (screenWidth * 0.85).clamp(280.0, 400.0);
      return Column(
        children:
            steps.map((step) {
              return Container(
                width: columnItemWidth,
                margin: const EdgeInsets.only(bottom: 30.0),
                child: step,
              );
            }).toList(),
      );
    } else {
      double cardWidthForWrap;
      if (screenWidth < 1100 && screenWidth >= 768) {
        cardWidthForWrap = (screenWidth / 2.5).clamp(280.0, 400.0);
      } else {
        cardWidthForWrap = (screenWidth / 3.5).clamp(280.0, 380.0);
      }
      return Wrap(
        spacing: (screenWidth * 0.05).clamp(20.0, 30.0),
        runSpacing: 40.0,
        alignment: WrapAlignment.center,
        children:
            steps.map((step) {
              return SizedBox(width: cardWidthForWrap, child: step);
            }).toList(),
      );
    }
  }
}

class SiteExplanationStep extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const SiteExplanationStep({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Definir um ponto de quebra para tamanhos de fonte/imagem dentro do card,
    // ou basear-se na largura efetiva que o card recebe (LayoutBuilder seria ideal aqui).
    // Para simplificar, vamos usar um breakpoint genérico.

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallCardContext =
            constraints.maxWidth <
            450; // Se o card estiver em um contexto muito estreito
        final double imageSize = isSmallCardContext ? 180 : 250;
        final double titleFontSize = isSmallCardContext ? 22 : 28;
        final double descriptionFontSize = isSmallCardContext ? 15 : 18;

        final effectiveTitleStyle =
            titleStyle ??
            TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: AppTheme.preto,
            );
        final effectiveDescriptionStyle =
            descriptionStyle ??
            TextStyle(
              fontSize: descriptionFontSize,
              color: AppTheme.preto,
              fontWeight: FontWeight.w400,
            );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: imageSize,
                maxHeight: imageSize,
              ),
              child: Image.asset(
                imagePath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
                cacheHeight: imageSize.ceil(),
                cacheWidth: imageSize.ceil(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: effectiveTitleStyle,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: effectiveDescriptionStyle,
            ),
          ],
        );
      },
    );
  }
}
