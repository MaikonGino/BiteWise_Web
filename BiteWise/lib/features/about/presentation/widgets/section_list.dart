import 'package:bitewise/features/about/domain/section_item.dart';
import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  final List<SectionItem> sections;
  final double spacing; // Spacing between image and text within a section item
  final EdgeInsets padding; // Padding for each section item

  const SectionList({
    super.key,
    required this.sections,
    this.spacing = 60.0, // Default spacing between image and text
    this.padding = const EdgeInsets.symmetric(
      horizontal: 25.0,
      vertical: 24.0,
    ), // Default padding around each section item
  });

  @override
  Widget build(BuildContext context) {
    return _buildSectionList(context);
  }

  Widget _buildSectionList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      separatorBuilder:
          (context, index) => const SizedBox(
            height: 40.0, // Space between each SectionItem block
          ),
      itemBuilder: (context, index) {
        // Pass current index and total number of sections
        return _buildSectionItem(
          context,
          sections[index],
          index,
          sections.length,
        );
      },
    );
  }

  // Updated signature to include currentIndex and totalItems
  Widget _buildSectionItem(
    BuildContext context,
    SectionItem item,
    int currentIndex,
    int totalItems,
  ) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isTabletOrLarger = constraints.maxWidth >= 768.0;
        final bool isLastItem = currentIndex == totalItems - 1;

        final double imageMaxWidth;
        final double imageMaxHeight;

        if (isTabletOrLarger) {
          imageMaxWidth = (constraints.maxWidth * 0.4).clamp(280.0, 450.0);
          imageMaxHeight = imageMaxWidth;
        } else {
          imageMaxWidth = constraints.maxWidth * 0.65;
          imageMaxHeight = constraints.maxWidth * 0.65;
        }

        final Widget imageWidget = _buildItemImage(
          item.imageUrl,
          imageMaxWidth,
          imageMaxHeight,
        );

        final Widget textBlockWidget = _buildItemText(item.textItems);

        Widget content;

        if (isTabletOrLarger) {
          List<Widget> rowChildren;
          if (item.reverseLayout) {
            rowChildren = [
              Center(child: textBlockWidget),
              Center(child: imageWidget),
            ];
          } else {
            rowChildren = [
              Center(child: imageWidget),
              SizedBox(width: spacing),
              Center(child: textBlockWidget),
            ];
          }
          content = Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowChildren,
          );
        } else {
          // Vertical layout for smaller screens
          List<Widget> smallScreenChildren = [
            textBlockWidget,
          ]; // Text always first

          // Add image and spacing only if it's NOT the last item on a small screen
          if (!isLastItem) {
            smallScreenChildren.addAll([
              SizedBox(height: spacing),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: imageMaxWidth,
                  maxHeight: imageMaxHeight,
                ),
                child: imageWidget,
              ),
            ]);
          }
          // For the last item on a small screen, only the textBlockWidget will be shown.

          content = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: smallScreenChildren,
          );
        }

        return Padding(padding: padding, child: content);
      },
    );
  }

  Widget _buildItemImage(String imageUrl, double maxWidth, double maxHeight) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Image.asset(imageUrl, fit: BoxFit.contain),
    );
  }

  Widget _buildItemText(List<Widget> textWidgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: textWidgets,
    );
  }
}
