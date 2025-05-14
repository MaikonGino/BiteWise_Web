import 'package:flutter/material.dart';

class SectionItem {
  final String imageUrl;
  final List<Widget> textItems;
  final bool reverseLayout;

  SectionItem({
    required this.imageUrl,
    required this.textItems,
    this.reverseLayout = false,
  });
}
