import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/features/profile/presentation/side_menu.dart';
import 'package:bitewise/shared/widgets/footer_widget.dart';
import 'package:bitewise/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: SingleChildScrollView(
        child: Column(children: [_buildContentRow(), FooterWidget()]),
      ),
    );
  }

  Widget _buildContentRow() {
    return Row(
      children: [
        SideMenu(),
        Container(
          height: 600,
          width: 1058,
          decoration: BoxDecoration(color: AppTheme.laranjaPaprika),
        ),
      ],
    );
  }
}
