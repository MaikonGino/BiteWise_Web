import 'package:bitewise/core/constants/plan_data.dart';
import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/plan_selection/plan_card.dart';
import 'package:flutter/material.dart';

class PlanSelectionWidget extends StatelessWidget {
  final bool showHeaderText;

  const PlanSelectionWidget({super.key, this.showHeaderText = true});

  // Pré-processa footerText rico para evitar split no build
  InlineSpan _buildFooterRichTextSpan(PlanModel model, TextStyle baseStyle) {
    if (model.id == 'annual' &&
        model.footerText.contains("e aproveite 2 meses grátis*.")) {
      final parts = model.footerText.split("e aproveite 2 meses grátis*.");
      return TextSpan(
        style: baseStyle,
        children: [
          TextSpan(text: parts[0]),
          const TextSpan(
            text: 'e aproveite 2 meses grátis*.',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          if (parts.length > 1) TextSpan(text: parts[1]),
        ],
      );
    }
    return TextSpan(text: model.footerText, style: baseStyle);
  }

  List<Widget> _buildPrimaryDescription(BuildContext context, PlanModel model) {
    const double descriptionFontSize = 15.0;
    final List<Widget> columnChildren = [];

    for (int i = 0; i < model.descriptionItems.length; i++) {
      columnChildren.add(
        Text(
          model.descriptionItems[i],
          style: const TextStyle(
            fontSize: descriptionFontSize,
            color: AppTheme.preto,
          ),
        ),
      );
      if (i < model.descriptionItems.length - 1) {
        final bool isSpecialSpacingCase =
            model.id == 'free' && model.descriptionItems.length == 4 && i == 2;

        columnChildren.add(SizedBox(height: isSpecialSpacingCase ? 10 : 5));
      }
    }
    return [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren,
        ),
      ),
    ];
  }

  List<Widget> _buildSecondaryDescription(
    BuildContext context,
    PlanModel model,
  ) {
    const double descriptionFontSize = 15.0;
    if (model.secondDescriptionItems == null ||
        model.secondDescriptionItems!.isEmpty) {
      return [];
    }
    return model.secondDescriptionItems!
        .map(
          (itemText) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              itemText,
              style: const TextStyle(
                fontSize: descriptionFontSize,
                color: AppTheme.preto,
              ),
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildCardFooter(
    BuildContext context,
    PlanModel model,
    bool isSmallScreen,
  ) {
    final double footerContentTextSize = isSmallScreen ? 14.5 : 16;
    final double buttonTopPadding = isSmallScreen ? 20 : 30;
    final double buttonFontSize = isSmallScreen ? 14 : 15;

    double dividerTopMargin;
    switch (model.id) {
      case 'free':
        dividerTopMargin = isSmallScreen ? 25 : 130;
        break;
      case 'annual':
        dividerTopMargin = isSmallScreen ? 25 : 80;
        break;
      case 'monthly':
      default:
        dividerTopMargin = isSmallScreen ? 25 : 60;
        break;
    }

    final TextStyle baseFooterStyle = TextStyle(
      color: AppTheme.preto,
      fontSize: footerContentTextSize,
    );

    return [
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: dividerTopMargin, left: 15, right: 15),
            height: 1,
            color: AppTheme.preto.withOpacity(0.25),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: RichText(
              textAlign: TextAlign.center,
              text: _buildFooterRichTextSpan(model, baseFooterStyle),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: buttonTopPadding, bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Future.microtask(() {
                  Navigator.pushNamed(context, model.footerButtonAction);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: model.footerButtonColor,
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 20 : 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                model.footerButtonText,
                style: TextStyle(
                  fontWeight:
                      model.id == 'annual' ? FontWeight.w700 : FontWeight.w800,
                  color: model.footerButtonTextColor,
                  fontSize: buttonFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildHeaderText(BuildContext context, double horizontalPadding) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 768;
    final double titleFontSize = isSmallScreen ? 28 : 36;
    final double subtitleFontSize = isSmallScreen ? 18 : 26;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Escolha seu plano',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              color: AppTheme.preto,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Veja os benefícios de cada plano',
            style: TextStyle(fontSize: subtitleFontSize, color: AppTheme.preto),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCardFromData({
    required BuildContext context,
    required PlanModel planModel,
    required double cardWidth,
    required bool isDesktopLayout,
    required bool isSmallScreen,
  }) {
    final firstDescriptionWidgets = _buildPrimaryDescription(
      context,
      planModel,
    );
    final secondTitle = planModel.secondTitle ?? '';
    final secondDescriptionWidgets = _buildSecondaryDescription(
      context,
      planModel,
    );
    final cardFooterWidgets = _buildCardFooter(
      context,
      planModel,
      isSmallScreen,
    );

    return PlanSelectionCard(
      imagePath: planModel.imagePath,
      firstTitle: planModel.firstTitle,
      firstDescription: firstDescriptionWidgets,
      secondTitle: secondTitle,
      secondDescription: secondDescriptionWidgets,
      cardFooter: cardFooterWidgets,
      headerColor: planModel.headerColor,
      cardWidth: cardWidth,
      isDesktopLayout: isDesktopLayout,
    );
  }

  Widget _buildPlanCardsLayout(
    BuildContext context,
    bool isDesktopLayout,
    bool isSmallScreen,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (appAvailablePlans.isEmpty) {
      return const Center(child: Text("Nenhum plano disponível no momento."));
    }

    if (isDesktopLayout) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            appAvailablePlans.map((planModel) {
              return Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: _buildPlanCardFromData(
                    context: context,
                    planModel: planModel,
                    cardWidth: double.infinity,
                    isDesktopLayout: true,
                    isSmallScreen: isSmallScreen,
                  ),
                ),
              );
            }).toList(),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: appAvailablePlans.length,
        itemBuilder: (context, index) {
          final planModel = appAvailablePlans[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: _buildPlanCardFromData(
              context: context,
              planModel: planModel,
              cardWidth: (screenWidth * 0.9).clamp(300.0, 450.0),
              isDesktopLayout: false,
              isSmallScreen: isSmallScreen,
            ),
          );
        },
      );
    }
  }

  Widget _buildFooterText(BuildContext context, double horizontalPadding) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 668;
    final double footerNoteFontSize = isSmallScreen ? 10 : 12;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 30,
      ),
      child: Text(
        '*Ao optar pelo Plano Anual, você economiza o equivalente a 2 meses em comparação ao custo acumulado do Plano Mensal, garantindo o melhor custo-benefício. Essa economia é exclusiva para assinaturas do Plano Anual e não representa um desconto adicional ou promoção separada. A gratuidade referida aplica-se exclusivamente ao cálculo comparativo entre os planos e não é válida de forma independente. Aproveite essa oportunidade única para maximizar os benefícios do BiteWise e economizar enquanto desfruta de uma experiência completa.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: footerNoteFontSize, color: AppTheme.preto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 800;
    final bool isDesktopLayout = screenWidth >= 840;
    final double horizontalPagePadding = (screenWidth * 0.05).clamp(
      16.0,
      120.0,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPagePadding),
      width: screenWidth,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeaderText)
              _buildHeaderText(context, horizontalPagePadding),
            const SizedBox(height: 40),
            _buildPlanCardsLayout(context, isDesktopLayout, isSmallScreen),
            const SizedBox(height: 20),
            _buildFooterText(context, horizontalPagePadding),
          ],
        ),
      ),
    );
  }
}
