import 'package:bitewise/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        onNavigate: (String screenKeyOrRoutePath) {
          // Obtém o nome da rota atual para evitar navegações desnecessárias
          // ou loops de substituição.
          final String? currentRouteName =
              ModalRoute.of(context)?.settings.name;

          String targetRoutePath =
              screenKeyOrRoutePath.startsWith('/')
                  ? screenKeyOrRoutePath
                  : '/$screenKeyOrRoutePath';

          // Mapeamento específico se a screenKey do header for diferente do path da rota
          // Ex: se o link 'Planos' no header tem screenKey 'planos' mas a rota é '/'
          if (screenKeyOrRoutePath == 'planos') {
            targetRoutePath = '/';
          }

          if (currentRouteName != targetRoutePath) {
            Navigator.pushReplacementNamed(context, targetRoutePath);
          }
        },
      ),
      body: child,
    );
  }
}
