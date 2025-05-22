import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SiteBenefitsWidget extends StatelessWidget {
  // Define constants to avoid recalculation
  static const double _smallScreenBreakpoint = 768;

  // Predefine text styles as constants
  static const TextStyle _boldStyle = TextStyle(fontWeight: FontWeight.w800);

  // Predefined text spans for benefits
  static const TextSpan _benefitTextSpan1 = TextSpan(
    text:
        'Descubra receitas em segundos. Mais tempo para estar com quem você ama!',
  );

  static const TextSpan _benefitTextSpan2 = TextSpan(
    text:
        'Navegue sem anúncios e com histórico completo das suas receitas favoritas.',
  );

  static const TextSpan _benefitTextSpan3 = TextSpan(
    text:
        'Aproveite ao máximo os ingredientes que você já tem. Sem desperdícios!',
  );

  static final List<TextSpan> _benefitTextSpan4 = [
    const TextSpan(
      text: 'Plano anual com 2 meses grátis*! ',
      style: _boldStyle,
    ),
    const TextSpan(
      text: 'Com 16% de desconto, você paga menos e aproveita mais.',
    ),
  ];

  // Pre-loaded SVG to avoid reloading
  static final Widget _logoSvg = SvgPicture.asset(
    'images/shared/LOGO.svg',
    // Use placeholders and caching for SVGs to improve loading
    placeholderBuilder: (BuildContext context) => const SizedBox(),
    cacheColorFilter: true,
  );

  const SiteBenefitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get MediaQuery only once
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final bool isSmallScreen = screenWidth < _smallScreenBreakpoint;

    // Calculate padding only once
    final double horizontalPagePadding = (screenWidth * 0.05).clamp(
      16.0,
      100.0,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPagePadding),
      width: screenWidth,
      // Avoid excessive nesting by using a LayoutBuilder
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderText(isSmallScreen),
              _buildBenefitTiles(isSmallScreen, constraints.maxWidth),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderText(bool isSmallScreen) {
    // Predefine text styles outside the build method
    final titleStyle = TextStyle(
      fontSize: isSmallScreen ? 24.0 : 30.0,
      color: AppTheme.preto,
      fontWeight: FontWeight.w800,
    );

    final descriptionStyle = TextStyle(
      fontSize: isSmallScreen ? 15.0 : 16.0,
      color: AppTheme.preto,
      height: 1.4,
    );

    // Use const for padding values
    final topPadding = isSmallScreen ? 20.0 : 30.0;
    final bottomPadding = isSmallScreen ? 10.0 : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menos tempo na cozinha, mais sabor na sua vida!',
          style: titleStyle,
        ),
        Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          child: Text(
            'Já imaginou transformar a sua cozinha em um espaço de criatividade e economia? Com o BiteWise, você aproveita seus ingredientes ao máximo. Experimente grátis e veja como é fácil planejar refeições incríveis com o que você já tem em casa!',
            style: descriptionStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitTiles(bool isSmallScreen, double availableWidth) {
    // Pre-generate tiles with optimized parameters to reduce calculations in build phase
    return Column(
      children: [
        SiteBenefitTile.optimized(
          imagePath: 'images/home/ITEM-1.webp',
          tileText: const [_benefitTextSpan1],
          additionalTileItem: _logoSvg,
          hasBorder: true,
          isSmallScreen: isSmallScreen,
          availableWidth: availableWidth,
        ),
        SiteBenefitTile.optimized(
          imagePath: 'images/home/ITEM-2.webp',
          tileText: const [_benefitTextSpan2],
          hasBorder: true,
          isSmallScreen: isSmallScreen,
          availableWidth: availableWidth,
        ),
        SiteBenefitTile.optimized(
          imagePath: 'images/home/ITEM-3.webp',
          tileText: const [_benefitTextSpan3],
          hasBorder: true,
          isSmallScreen: isSmallScreen,
          availableWidth: availableWidth,
        ),
        SiteBenefitTile.optimized(
          imagePath: 'images/home/ITEM-4.webp',
          tileText: _benefitTextSpan4,
          hasBorder: false,
          isSmallScreen: isSmallScreen,
          availableWidth: availableWidth,
        ),
      ],
    );
  }
}

class SiteBenefitTile extends StatelessWidget {
  final String imagePath;
  final List<TextSpan> tileText;
  final Widget? additionalTileItem;
  final bool hasBorder;
  final bool isSmallScreen;
  final double availableWidth;

  // Constants for responsive design
  static const double _desktopImageSize = 180.0;
  static const double _desktopFontSize = 18.0;
  static const double _mobileFontSize = 16.0;
  static const double _desktopAdditionalItemSize = 150.0;
  static const double _desktopSpacing = 24.0;
  static const double _mobileSpacing = 16.0;

  // Cache derived values that don't change for optimization
  late final double _imageSize;
  late final double _defaultTextFontSize;
  late final double _spacing;
  late final List<TextSpan> _adjustedTileText;
  late final Widget _imageWidget;
  late final Widget _textWidget;
  late final Widget? _finalAdditionalItemWidget;
  late final Border? _border;

  // Factory constructor for optimal caching
  factory SiteBenefitTile.optimized({
    required String imagePath,
    required List<TextSpan> tileText,
    Widget? additionalTileItem,
    required bool hasBorder,
    required bool isSmallScreen,
    required double availableWidth,
  }) {
    return SiteBenefitTile._internal(
      imagePath: imagePath,
      tileText: tileText,
      additionalTileItem: additionalTileItem,
      hasBorder: hasBorder,
      isSmallScreen: isSmallScreen,
      availableWidth: availableWidth,
    );
  }

  // Private constructor that initializes all cached values
  SiteBenefitTile._internal({
    required this.imagePath,
    required this.tileText,
    this.additionalTileItem,
    required this.hasBorder,
    required this.isSmallScreen,
    required this.availableWidth,
  }) {
    // Initialize all derived values only once
    _imageSize =
        isSmallScreen
            ? (availableWidth * 0.3).clamp(100.0, 150.0)
            : _desktopImageSize;

    _defaultTextFontSize = isSmallScreen ? _mobileFontSize : _desktopFontSize;
    _spacing = isSmallScreen ? _mobileSpacing : _desktopSpacing;

    // Process text spans only once
    _adjustedTileText =
        tileText.map((textSpan) {
          final existingStyle = textSpan.style ?? const TextStyle();
          return TextSpan(
            text: textSpan.text,
            children: textSpan.children,
            style: existingStyle.copyWith(
              fontSize: existingStyle.fontSize ?? _defaultTextFontSize,
              color: existingStyle.color ?? AppTheme.preto,
            ),
            recognizer: textSpan.recognizer,
          );
        }).toList();

    // Pre-build reused widgets
    _imageWidget = Image.asset(
      imagePath,
      height: _imageSize,
      width: _imageSize,
      fit: BoxFit.contain,
      // Use caching for images to improve loading time
      cacheHeight: _imageSize.ceil(),
      cacheWidth: _imageSize.ceil(),
      // Add image loading optimization
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        return const SizedBox();
      },
    );

    _textWidget = RichText(
      textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
      text: TextSpan(children: _adjustedTileText),
    );

    // Only create additional item widget if needed
    _finalAdditionalItemWidget =
        (!isSmallScreen && additionalTileItem != null)
            ? SizedBox(
              width: _desktopAdditionalItemSize,
              height: _desktopAdditionalItemSize,
              child: FittedBox(fit: BoxFit.contain, child: additionalTileItem),
            )
            : null;

    // Create border only once
    final BorderSide? borderSide =
        hasBorder
            ? BorderSide(width: 1, color: AppTheme.preto.withOpacity(0.15))
            : null;

    _border = borderSide != null ? Border(bottom: borderSide) : null;
  }

  @override
  Widget build(BuildContext context) {
    // All expensive calculations are already done in the constructor
    return RepaintBoundary(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: isSmallScreen ? 10.0 : 0,
        ),
        decoration: BoxDecoration(border: _border),
        child:
            isSmallScreen
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _imageWidget,
                    SizedBox(height: _spacing),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: availableWidth * 0.05,
                      ),
                      child: _textWidget,
                    ),
                  ],
                )
                : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _imageWidget,
                    SizedBox(width: _spacing + 10),
                    Expanded(child: _textWidget),
                    if (_finalAdditionalItemWidget != null) ...[
                      SizedBox(width: _spacing + 10),
                      _finalAdditionalItemWidget,
                    ],
                  ],
                ),
      ),
    );
  }
}
