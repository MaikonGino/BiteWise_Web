import 'package:flutter/material.dart';

class FlexibleSectionItem extends StatelessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  final bool reverseOrder;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final Axis direction;
  final double spacing;

  const FlexibleSectionItem({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    this.reverseOrder = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.direction = Axis.horizontal,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final children =
        reverseOrder
            ? [
              secondWidget,
              SizedBox(
                width: direction == Axis.horizontal ? spacing : 0,
                height: direction == Axis.vertical ? spacing : 0,
              ),
              firstWidget,
            ]
            : [
              firstWidget,
              SizedBox(
                width: direction == Axis.horizontal ? spacing : 0,
                height: direction == Axis.vertical ? spacing : 0,
              ),
              secondWidget,
            ];

    return direction == Axis.horizontal
        ? Row(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        )
        : Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        );
  }
}
