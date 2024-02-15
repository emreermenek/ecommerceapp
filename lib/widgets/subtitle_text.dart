import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget(
      {super.key,
      required this.lable,
      this.fontSize = 18,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.color,
      this.textDecoration = TextDecoration.none});

  final String lable;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color? color;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: null,
          decoration: textDecoration),
    );
  }
}
