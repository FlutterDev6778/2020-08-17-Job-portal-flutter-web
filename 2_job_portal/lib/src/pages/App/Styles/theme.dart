import 'package:flutter/material.dart';

ThemeData buildThemeData(BuildContext context) {
  final baseTheme = ThemeData(
    fontFamily: "GothamHTF",
    primaryColor: Color(0xFFB58970),
    sliderTheme: SliderTheme.of(context).copyWith(
      trackHeight: 2,
    ),
  );

  return baseTheme;
}
