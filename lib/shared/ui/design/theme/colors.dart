import 'package:flutter/material.dart';

abstract class AppColors {
  Color get base;
  Color get background;
  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get userMessage;
  Color get textColor;
  Color get yellowLight;
  Color get yellowDark;
}

class DarkColors extends AppColors {
  @override
  final base = const Color(0xFFD9D9D9);
  @override
  final background = const Color(0xFF010101);
  @override
  final primary = const Color(0xFFC09FF8);
  @override
  final secondary = const Color(0xFFC6F432);
  @override
  final tertiary = const Color(0xFFFEC4DD);

  @override
  Color get userMessage => const Color(0xFFA370F7);

  @override
  Color get textColor => Colors.white;
  @override
  Color get yellowLight => const Color(0xFFFFEB8B);
  @override
  Color get yellowDark => const Color(0xFFC6FF5F);
}

class LightColors extends AppColors {
  @override
  final base = const Color(0xFF010101);
  @override
  final background = const Color(0xFFFFFFF9);
  @override
  final primary = const Color(0xFF4A90E2);
  @override
  final secondary = const Color(0xFF40D3B2);
  @override
  final tertiary = const Color(0xFFFEC4DD);

  @override
  Color get userMessage => const Color(0xFFCFA5FD);

  @override
  Color get textColor => Colors.black;
  @override
  Color get yellowLight => const Color(0xFFFFEB8B);
  @override
  Color get yellowDark => const Color(0xFFC6FF5F);
}
