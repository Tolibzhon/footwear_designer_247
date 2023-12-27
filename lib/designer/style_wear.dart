import 'package:flutter/material.dart';

class StylesWear {
  static TextStyle style({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? wordSpacing,
    double fontSize = 16,
  }) =>
      TextStyle(
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontSize: fontSize,
        color: color,
        fontFamily: 'Inter',
        wordSpacing: wordSpacing,
      );
}
