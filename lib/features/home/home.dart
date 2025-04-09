import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/features/home/presentation/plan_selection.dart';
import 'package:bitewise/features/home/presentation/site_benefits.dart';
import 'package:bitewise/shared/widgets/footer_widget.dart';
import 'package:bitewise/shared/widgets/header_widget.dart';
import 'package:bitewise/features/home/presentation/recipe_generation.dart';
import 'package:bitewise/features/home/presentation/site_explanation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.branco,
      appBar: HeaderWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipeGenWidget(),
            SiteExplanationWidget(),
            Container(
              height: 2,
              width: 1150,
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppTheme.preto.withValues(alpha: 0.25),
                ),
              ),
            ),
            PlanSelectionWidget(),
            Container(
              height: 2,
              width: 1150,
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppTheme.preto.withValues(alpha: 0.25),
                ),
              ),
            ),
            SiteBenefitsWidget(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
