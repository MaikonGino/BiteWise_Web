import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecipeGenWidget extends StatefulWidget {
  const RecipeGenWidget({super.key});

  @override
  State<RecipeGenWidget> createState() => _RecipeGenWidgetState();
}

class _RecipeGenWidgetState extends State<RecipeGenWidget> {
  bool _showTextField = false;
  bool _showSvgOverlays = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final bool isSmallScreen = screenWidth < 768;

    final double widgetHeight = isSmallScreen ? 580.0 : 600.0;
    final double horizontalPadding = (screenWidth * 0.05).clamp(20.0, 100.0);
    final double titleVerticalPadding = isSmallScreen ? 30.0 : 50.0;
    final double titleFontSize = isSmallScreen ? 32.0 : 50.0;
    final double ingredientsLabelFontSize = isSmallScreen ? 16.0 : 20.0;
    final double buttonFontSize = isSmallScreen ? 16.0 : 17.0;
    final double sideNoteFontSize = isSmallScreen ? 15.0 : 18.0;
    final double mainContentWidth = (screenWidth * 0.8).clamp(300.0, 940.0);
    final double buttonWidth = (mainContentWidth * 0.5).clamp(200.0, 320.0);

    final titleStyle = TextStyle(
      fontSize: titleFontSize,
      fontWeight: FontWeight.w500,
    );
    final ingredientsLabelStyle = TextStyle(
      color: AppTheme.vermelhoTomate,
      fontSize: ingredientsLabelFontSize,
      fontWeight: FontWeight.w300,
    );
    final buttonTextStyle = TextStyle(
      color: AppTheme.branco,
      fontWeight: FontWeight.w600,
      fontSize: buttonFontSize,
    );
    final sideNoteStyle = TextStyle(
      fontSize: sideNoteFontSize,
      fontWeight: FontWeight.w600,
    );

    return VisibilityDetector(
      key: const Key('recipe_gen_visibility'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          setState(() {
            _showTextField = true;
            _showSvgOverlays = true;
          });
        }
      },
      child: Container(
        height: widgetHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/shared/BACKGROUND-TOPO.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: titleVerticalPadding,
                      bottom: titleVerticalPadding / 2,
                    ),
                    child: Text(
                      'A sua receita perfeita em instantes!',
                      textAlign: TextAlign.center,
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: SizedBox(
                      width: mainContentWidth,
                      child: Text(
                        'Escreva aqui seus ingredientes:',
                        style: ingredientsLabelStyle,
                      ),
                    ),
                  ),
                  if (_showTextField)
                    SizedBox(
                      width: mainContentWidth,
                      child: TextField(
                        minLines: isSmallScreen ? 2 : 1,
                        maxLines: isSmallScreen ? 4 : 1,
                        cursorColor: AppTheme.vermelhoTomate,
                        decoration: AppTheme.textFieldDecoration,
                      ),
                    ),
                  if (isSmallScreen)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        'Digite os ingredientes que você tem em casa, e deixe que fazemos a mágica para você!',
                        textAlign: TextAlign.center,
                        style: sideNoteStyle,
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 50,
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/recipe'),
                      style: AppTheme.recipeGenerationButton,
                      child: Text(
                        'Encontre sua próxima refeição',
                        textAlign: TextAlign.center,
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isSmallScreen && _showSvgOverlays) ...[
              Positioned(
                right: (screenWidth * 0.05).clamp(10.0, 70.0),
                top: (widgetHeight * 0.5).clamp(330.0, 380.0),
                child: SvgPicture.asset(
                  'images/shared/LOGO.svg',
                  width: (screenWidth * 0.15).clamp(150.0, 270.0),
                  height: (screenWidth * 0.15).clamp(150.0, 270.0),
                ),
              ),
              Positioned(
                left: (screenWidth * 0.05).clamp(20.0, 70.0),
                bottom: (widgetHeight * 0.1).clamp(120.0, 200.0),
                child: SvgPicture.asset(
                  'images/home/SETA.svg',
                  width: (screenWidth * 0.2).clamp(150.0, 300.0),
                  height: (screenWidth * 0.18).clamp(120.0, 250.0),
                ),
              ),
              Positioned(
                top: (widgetHeight * 0.7).clamp(450.0, 480.0),
                left: horizontalPadding + 30,
                child: SizedBox(
                  width: (screenWidth * 0.3).clamp(250.0, 450.0),
                  child: Text(
                    'Digite os ingredientes que você tem em casa, e deixe que fazemos a mágica para você!',
                    style: sideNoteStyle,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
