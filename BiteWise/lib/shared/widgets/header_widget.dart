import 'package:flutter/material.dart';
import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/shared/widgets/custom_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String screenKey) onNavigate;

  static const double _mobileBreakpoint = 768;
  static const double _headerHeight = 70;

  const HeaderWidget({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(_headerHeight);

  Widget _buildNavigationLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(text: 'Planos', screenKey: 'home', onNavigate: onNavigate),
        const SizedBox(width: 25),
        _NavLink(
          text: 'Sobre nós',
          screenKey: 'sobre-nos',
          onNavigate: onNavigate,
        ),
        const SizedBox(width: 25),
        _NavLink(
          text: 'Contato e FAQ',
          screenKey: 'contato',
          onNavigate: onNavigate,
        ),
      ],
    );
  }

  Widget _buildActionLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(text: 'Login', screenKey: 'login', onNavigate: onNavigate),
        const SizedBox(width: 20),
        _NavLink(
          text: 'Começar gratuitamente',
          screenKey: 'register',
          isButton: true,
          onNavigate: onNavigate,
        ),
      ],
    );
  }

  Widget _buildLogo(bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(left: isMobile ? 10 : 40),
      child: SvgPicture.asset(
        'images/shared/LOGO.svg',
        width: isMobile ? 100 : 130,
        height: _headerHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < _mobileBreakpoint;
    final logo = _buildLogo(isMobile);

    if (isMobile) {
      return AppBar(
        backgroundColor: AppTheme.vermelhoTomate,
        elevation: 1,
        leadingWidth: 120,
        leading: logo,
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: AppTheme.branco,
                    size: 30,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
          const SizedBox(width: 10),
        ],
      );
    }

    return Material(
      elevation: 1,
      color: AppTheme.vermelhoTomate,
      child: Container(
        height: _headerHeight,
        padding: EdgeInsets.symmetric(
          horizontal: (screenWidth * 0.05).clamp(20.0, 60.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [logo, _buildNavigationLinks(), _buildActionLinks()],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final String screenKey;
  final bool isButton;
  final void Function(String) onNavigate;

  const _NavLink({
    required this.text,
    required this.screenKey,
    this.isButton = false,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final url = screenKey;
    if (isButton) {
      return ElevatedButton(
        style: AppTheme.headerElevatedButton,
        onPressed: () => onNavigate(screenKey),
        child: Text(text, style: AppTheme.buttonTextStyle),
      );
    }
    return CustomLink(
      text: text,
      url: url,
      onTap: () => onNavigate(screenKey),
      style: AppTheme.linkTextStyle,
      hasUnderline: false,
    );
  }
}
