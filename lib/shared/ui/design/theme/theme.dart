import 'package:chat_bot_poc/shared/ui/design/theme/colors.dart';
import 'package:flutter/material.dart';

enum Theme { light, dark }

final _baseTheme = ThemeData(useMaterial3: true);
final LightColors lightColors = LightColors();
final DarkColors darkColors = DarkColors();

final themeLight = _baseTheme.copyWith(
  scaffoldBackgroundColor: lightColors.background,
  primaryColor: lightColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: lightColors.secondary, // Cambia esto por el color que prefieras
    ),
  ),
);

final themeDark = _baseTheme.copyWith(
  scaffoldBackgroundColor: darkColors.background,
  primaryColor: darkColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: darkColors.secondary, // Cambia esto por el color que prefieras
    ),
  ),
);
