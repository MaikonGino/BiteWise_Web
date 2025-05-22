import 'package:flutter/material.dart';
import 'package:bitewise/shared/widgets/header_widget.dart';
import 'package:bitewise/shared/widgets/mobile/drawer_menu.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final void Function(String screenKeyOrRoutePath) navigateToScreen;

  const AppShell({
    super.key,
    required this.child,
    required this.navigateToScreen,
  });

  static const double _mobileBreakpoint = 768;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  AppDrawer? _cachedDrawer;
  HeaderWidget? _cachedHeader; // Similar para o header

  @override
  void initState() {
    super.initState();
    // Nota: MediaQuery não está disponível em initState de forma segura para obter o tamanho.
    // É melhor fazer isso em didChangeDependencies ou no build.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCachedWidgets();
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigateToScreen != widget.navigateToScreen) {
      _updateCachedWidgets(); // Recria se a callback mudou
    }
    // Você também precisaria de um jeito de ouvir mudanças de MediaQuery aqui
    // se a lógica de _mobileBreakpoint for crítica para o estado dos widgets cacheados.
  }

  void _updateCachedWidgets() {
    final bool isMobile =
        MediaQuery.sizeOf(context).width < AppShell._mobileBreakpoint;
    if (isMobile) {
      // Só recria se necessário (ex: se a callback mudou ou não existe)
      if (_cachedDrawer == null ||
          _cachedDrawer!.onNavigate != widget.navigateToScreen) {
        _cachedDrawer = AppDrawer(onNavigate: widget.navigateToScreen);
      }
    } else {
      _cachedDrawer = null;
    }

    if (_cachedHeader == null ||
        _cachedHeader!.onNavigate != widget.navigateToScreen) {
      _cachedHeader = HeaderWidget(onNavigate: widget.navigateToScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Precisamos garantir que _updateCachedWidgets seja chamado se a largura da tela cruzar o breakpoint.
    // Usar LayoutBuilder ou MediaQuery aqui e chamar _updateCachedWidgets se necessário é uma opção,
    // ou aceitar que o cache só é atualizado em didChangeDependencies/didUpdateWidget.
    // Para este exemplo, vamos assumir que _cachedDrawer foi atualizado corretamente.
    // A lógica isMobile aqui é para decidir se usa o drawer cacheado.
    final bool isMobileCurrentBuild =
        MediaQuery.sizeOf(context).width < AppShell._mobileBreakpoint;

    // Se o estado de 'isMobile' mudou desde a última vez que _cachedDrawer foi definido,
    // precisamos reavaliar. Isso torna o cache stateful complexo.
    // A abordagem stateless original é mais simples se os construtores dos widgets não forem pesados.

    // Se for optar por essa abordagem, a lógica em build para decidir se recria ou usa o cache
    // com base na mudança de `isMobileCurrentBuild` vs o estado quando o cache foi criado
    // torna-se crucial e pode ser complexa.

    // Por simplicidade e a menos que o CONSTRUTOR do AppDrawer seja o problema,
    // a versão stateless é geralmente preferível.

    // Versão stateless original (mais recomendada inicialmente):
    final bool isMobile =
        MediaQuery.sizeOf(context).width < AppShell._mobileBreakpoint;
    return Scaffold(
      appBar: HeaderWidget(onNavigate: widget.navigateToScreen),
      endDrawer:
          isMobile ? AppDrawer(onNavigate: widget.navigateToScreen) : null,
      body: widget.child,
    );
  }
}
