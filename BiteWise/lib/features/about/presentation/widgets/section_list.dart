import 'package:bitewise/features/about/domain/section_item.dart';
import 'package:bitewise/features/about/presentation/widgets/flexible_item.dart';
import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  final List<SectionItem> sections;
  final double spacing;
  final Axis itemDirection;
  final EdgeInsets padding;

  const SectionList({
    super.key,
    required this.sections,
    this.spacing = 10.0,
    this.itemDirection = Axis.horizontal,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return _buildSectionList();
  }

  Widget _buildSectionList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      separatorBuilder: (context, index) => SizedBox(height: 30.0),
      itemBuilder: (context, index) {
        return _buildSectionItem(sections[index]);
      },
    );
  }

  Widget _buildSectionItem(SectionItem item) {
    final imageWidget = _buildItemImage(item.imageUrl);
    final textWidget = _buildItemText(item.textItems);
    return Padding(
      padding: padding,
      child: FlexibleSectionItem(
        firstWidget: imageWidget,
        secondWidget: textWidget,
        reverseOrder: item.reverseLayout,
        spacing: spacing,
        direction: itemDirection,
      ),
    );
  }

  Widget _buildItemImage(String imageUrl) {
    return Image.asset(imageUrl, height: 450, width: 450);
  }

  Widget _buildItemText(List<Widget> textWidgets) {
    return Column(
      spacing: 50,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < textWidgets.length; i++) ...[textWidgets[i]],
      ],
    );
  }
}
