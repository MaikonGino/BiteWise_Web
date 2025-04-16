import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SiteBenefitsWidget extends StatelessWidget {
  const SiteBenefitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 30,
        children: [_buildHeaderText(), _buildBenefitsColumn(context)],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          'Menos tempo na cozinha, mais sabor na sua vida!',
          style: TextStyle(
            fontSize: 30,
            color: AppTheme.preto,
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Já imaginou transformar a sua cozinha em um espaço de criatividade e economia? Com o BiteWise, você aproveita seus ingredientes ao máximo. Experimente grátis e veja como é fácil planejar refeições incríveis com o que você já tem em casa!',
            style: TextStyle(fontSize: 16, color: AppTheme.preto),
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitsColumn(BuildContext context) {
    return Column(
      children: [
        _buildBenefitTile(
          context: context,
          imagePath: 'images/ITEM-1.png',
          tileText: [
            TextSpan(
              text:
                  'Descubra receitas em segundos. Mais tempo para estar com que você ama!',
              style: TextStyle(color: AppTheme.preto, fontSize: 20),
            ),
          ],
          additionalTileItem: Image.asset(
            'images/LOGO.png',
            height: 250,
            width: 250,
          ),
          hasBorder: true,
        ),
        _buildBenefitTile(
          context: context,
          imagePath: 'images/ITEM-2.png',
          tileText: [
            TextSpan(
              text:
                  'Navegue sem anúncios e com histórico completo das suas receitas favoritas.',
              style: TextStyle(color: AppTheme.preto, fontSize: 20),
            ),
          ],

          hasBorder: true,
        ),
        _buildBenefitTile(
          context: context,
          imagePath: 'images/ITEM-3.png',
          tileText: [
            TextSpan(
              text:
                  'Aproveite ao máximo os ingredientes que você já tem. Sem desperdícios!',
              style: TextStyle(color: AppTheme.preto, fontSize: 20),
            ),
          ],

          hasBorder: true,
        ),
        _buildBenefitTile(
          context: context,
          imagePath: 'images/ITEM-4.png',
          tileText: [
            TextSpan(
              text: 'Plano anual com 2 meses grátis*!',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: AppTheme.preto,
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: ' Com 16% de desconto, você paga menos e aproveite mais.',
              style: TextStyle(color: AppTheme.preto, fontSize: 20),
            ),
          ],
          hasBorder: false,
        ),
      ],
    );
  }

  Widget _buildBenefitTile({
    required BuildContext context,
    required String imagePath,
    required tileText,
    Widget? additionalTileItem,
    required bool hasBorder,
  }) {
    return SiteBenefitTile(
      imagePath: imagePath,
      tileText: tileText,
      additionalTileItem: additionalTileItem,
      hasBorder: hasBorder,
    );
  }
}

class SiteBenefitTile extends StatelessWidget {
  final String imagePath;
  final List<TextSpan> tileText;
  final Widget? additionalTileItem;
  final bool hasBorder;

  const SiteBenefitTile({
    super.key,
    required this.imagePath,
    required this.tileText,
    this.additionalTileItem,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border:
            hasBorder
                ? Border(
                  bottom: BorderSide(
                    width: 2,
                    color: AppTheme.preto.withValues(alpha: 0.25),
                  ),
                )
                : null,
      ),
      child: Row(
        spacing: 30,
        children: [
          Image.asset(imagePath, height: 200, width: 200),
          Container(
            width: 500,
            alignment: Alignment.center,
            child: RichText(text: TextSpan(children: tileText)),
          ),
          const Spacer(),
          if (additionalTileItem != null) additionalTileItem!,
        ],
      ),
    );
  }
}
