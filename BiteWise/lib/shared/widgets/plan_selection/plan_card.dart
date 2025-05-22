import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:bitewise/core/theme/app_theme.dart';

class PlanSelectionCard extends StatefulWidget {
  final String imagePath;
  final String firstTitle;
  final List<Widget> firstDescription;
  final String secondTitle;
  final List<Widget> secondDescription;
  final List<Widget> cardFooter;
  final Color? headerColor;
  final double cardWidth;
  final bool isDesktopLayout;

  const PlanSelectionCard({
    super.key,
    required this.imagePath,
    required this.firstTitle,
    required this.firstDescription,
    required this.secondTitle,
    required this.secondDescription,
    required this.cardFooter,
    this.headerColor,
    required this.cardWidth,
    required this.isDesktopLayout,
  });

  @override
  State<PlanSelectionCard> createState() => _PlanSelectionCardState();
}

class _PlanSelectionCardState extends State<PlanSelectionCard> {
  bool _isExpanded = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isDesktopLayout;
  }

  @override
  void didUpdateWidget(covariant PlanSelectionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDesktopLayout != oldWidget.isDesktopLayout) {
      _isExpanded = widget.isDesktopLayout;
    }
  }

  Widget _buildHeader() {
    final double imageSize = widget.isDesktopLayout ? 90 : 70;
    final double headerHeight = widget.isDesktopLayout ? 120 : 100;
    final bool showBottomRadius = !widget.isDesktopLayout && !_isExpanded;

    return RepaintBoundary(
      child: Container(
        height: headerHeight,
        decoration: BoxDecoration(
          color:
              widget.headerColor ??
              AppTheme.vermelhoSecundario.withOpacity(0.75),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: Radius.circular(showBottomRadius ? 10 : 0),
            bottomRight: Radius.circular(showBottomRadius ? 10 : 0),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: -1,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:
                widget.isDesktopLayout
                    ? null
                    : () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
              bottomLeft: Radius.circular(showBottomRadius ? 10 : 0),
              bottomRight: Radius.circular(showBottomRadius ? 10 : 0),
            ),
            child:
                widget.isDesktopLayout
                    ? Center(
                      child: Image.asset(
                        widget.imagePath,
                        height: imageSize,
                        width: imageSize,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.medium,
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            widget.imagePath,
                            height: imageSize,
                            width: imageSize,
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.firstTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppTheme.branco,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            _isExpanded ? Icons.expand_less : Icons.expand_more,
                            size: 28,
                            color: AppTheme.branco,
                          ),
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    // Evita que VisibilityDetector impeça renderização se já estiver expandido
    final bool shouldRender =
        _isVisible || widget.isDesktopLayout || _isExpanded;

    return VisibilityDetector(
      key: Key('planCardContent-${widget.firstTitle}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child:
          widget.isDesktopLayout
              ? SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 25),
                child: _buildContentColumn(),
              )
              : AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild:
                    shouldRender
                        ? _buildContentColumn()
                        : const SizedBox.shrink(),
                crossFadeState:
                    _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),
    );
  }

  Widget _buildContentColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Text(
            widget.firstTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.preto,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...widget.firstDescription,
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.secondTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.preto,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...widget.secondDescription,
        const SizedBox(height: 25),
        ...widget.cardFooter,
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardWidth,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_buildHeader(), _buildContent()],
      ),
    );
  }
}
