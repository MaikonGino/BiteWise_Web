import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? style;
  final Color? color;
  final bool underline;

  const CustomLink({
    super.key,
    required this.text,
    required this.url,
    this.style,
    this.color,
    required this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, url),
        child: Text(
          text,
          style:
              style ??
              TextStyle(
                color: color ?? Colors.blue,
                decoration:
                    underline ? TextDecoration.underline : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
