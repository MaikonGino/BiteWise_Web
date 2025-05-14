import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/features/auth/presentation/widgets/login_form.dart';
import 'package:bitewise/shared/widgets/footer_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.branco,
      child: SingleChildScrollView(
        child: Column(children: [LoginForm(), FooterWidget()]),
      ),
    );
  }
}
