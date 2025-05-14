import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? style;
  final Color? color;
  final bool hasUnderline;
  final VoidCallback? onTap;

  const CustomLink({
    super.key,
    required this.text,
    required this.url,
    this.style,
    this.color,
    required this.hasUnderline,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style:
              style ??
              TextStyle(
                color: color ?? Colors.blue,
                decoration:
                    hasUnderline
                        ? TextDecoration.underline
                        : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
