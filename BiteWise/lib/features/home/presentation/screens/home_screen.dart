import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/plan_selection/plan_selection.dart';
import 'package:bitewise/features/home/presentation/widgets/site_benefits.dart';
import 'package:bitewise/shared/widgets/footer_widget.dart';
import 'package:bitewise/features/home/presentation/widgets/recipe_generation.dart';
import 'package:bitewise/features/home/presentation/widgets/site_explanation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Divider(
        height: 1,
        thickness: 1,
        color: AppTheme.preto025, // preto com alpha 0.25 (0x40)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.branco,
      child: CustomScrollView(
        slivers: [
          _lazySliver(key: 'recipe', child: const RecipeGenWidget()),
          _lazySliver(key: 'explanation', child: const SiteExplanationWidget()),
          SliverToBoxAdapter(child: _divider()),
          _lazySliver(key: 'plan', child: const PlanSelectionWidget()),
          SliverToBoxAdapter(child: _divider()),
          _lazySliver(key: 'benefits', child: const SiteBenefitsWidget()),
          _lazySliver(key: 'footer', child: const FooterWidget()),
        ],
      ),
    );
  }

  /// Helper para construir slivers com lazy rendering via VisibilityDetector
  SliverToBoxAdapter _lazySliver({required String key, required Widget child}) {
    return SliverToBoxAdapter(
      child: _LazyWidget(key: ValueKey(key), child: child),
    );
  }
}

/// Widget que só constrói seu conteúdo após ficar visível
class _LazyWidget extends StatefulWidget {
  final Widget child;

  const _LazyWidget({super.key, required this.child});

  @override
  State<_LazyWidget> createState() => _LazyWidgetState();
}

class _LazyWidgetState extends State<_LazyWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    if (_isVisible) return widget.child;

    return VisibilityDetector(
      key: widget.key as Key,
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.1) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: const SizedBox(
        height: 300, // espaço reservado para scroll não pular
      ),
    );
  }
}
