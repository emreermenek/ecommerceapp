import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      required this.size,
      required this.padding,
      required this.color,
      required this.borderRadius,
      required this.icon});

  final double size;
  final double padding;
  final Color color;
  final double borderRadius;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
            splashColor: Colors.red,
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Icon(
                icon,
                size: size,
              ),
            )));
  }
}
