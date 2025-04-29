import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.preto),
      height: 600,
      width: 300,
      child: Column(children: [Text("Side Menu")]),
    );
  }
}
