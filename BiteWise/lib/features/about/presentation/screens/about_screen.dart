import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/features/about/data/about_data.dart';
import 'package:bitewise/features/about/presentation/widgets/section_list.dart';
import 'package:bitewise/shared/widgets/footer_widget.dart';
import 'package:bitewise/shared/widgets/plan_selection.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionItems = getAboutSectionItems();

    return Container(
      color: AppTheme.branco,
      child: SingleChildScrollView(
        child: Column(
          spacing: 60,
          children: [
            SectionList(
              sections: sectionItems,
              itemDirection: Axis.horizontal,
              spacing: 15.0,
            ),
            PlanSelectionWidget(showHeaderText: false),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
