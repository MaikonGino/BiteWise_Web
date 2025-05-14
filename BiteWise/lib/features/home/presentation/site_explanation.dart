import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SiteExplanationWidget extends StatelessWidget {
  const SiteExplanationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        children: [
          Container(
            width: 1150,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.black.withValues(alpha: 0.25),
                  width: 1,
                ),
              ),
            ),
            child: Text(
              'Como o BiteWise funciona?',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              spacing: 50,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SiteExplanationSteps(
                  imagePath: 'images/PASSO-01.png',
                  title: 'Passo 01',
                  description:
                      'Digite seus ingredientes. Encontre receitas que combinam perfeitamente com o que você tem.',
                ),
                SiteExplanationSteps(
                  imagePath: 'images/PASSO-02.png',
                  title: 'Passo 02',
                  description:
                      'Descubra uma receita com os seus ingredientes de casa! Prepare-se para cozinhar uma refeição deliciosa.',
                ),
                SiteExplanationSteps(
                  imagePath: 'images/PASSO-03.png',
                  title: 'Passo 03',
                  description:
                      'Siga os passos da receita. Desfrute do seu prato feito em casa, e com a orientação do BiteWise.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SiteExplanationSteps extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const SiteExplanationSteps({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(imagePath, width: 280, height: 280)),
          const SizedBox(height: 8),
          Text(
            title,
            style:
                titleStyle ??
                const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.preto,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
              color: AppTheme.preto,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
