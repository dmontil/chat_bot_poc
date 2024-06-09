import 'package:chat_bot_poc/shared/ui/design/theme/colors.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme.dart';
import 'package:flutter/material.dart' hide Theme;

extension AppStylingContext on BuildContext {
  AppColors get colors => AppTheme.of(this).colors;
}

class AppThemeConfig {
  AppThemeConfig({
    required this.theme,
  }) : colors = theme == Theme.light ? LightColors() : DarkColors();

  final Theme theme;
  final AppColors colors;

  bool get isLight => theme == Theme.light;
}

class AppThemeProvider extends StatefulWidget {
  const AppThemeProvider({
    required this.child,
    this.defaultTheme = Theme.dark,
    super.key,
  });

  final Widget child;
  final Theme defaultTheme;

  @override
  State<AppThemeProvider> createState() => AppThemeProviderState();
}

class AppThemeProviderState extends State<AppThemeProvider> {
  late final Theme defaultTheme = widget.defaultTheme;
  Theme? _forcedTheme;

  void _toggle() {
    setState(() {
      _forcedTheme = _forcedTheme == null || _forcedTheme == Theme.light
          ? Theme.dark
          : Theme.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: AppThemeConfig(theme: _forcedTheme ?? defaultTheme),
      toggle: _toggle,
      child: widget.child,
    );
  }
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    required AppThemeConfig theme,
    required this.toggle,
    required super.child,
    super.key,
  }) : _themeConfig = theme;

  final AppThemeConfig _themeConfig;

  final void Function() toggle;

  AppColors get colors => _themeConfig.colors;

  bool get isLight => _themeConfig.isLight;

  static AppTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No VoTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      _themeConfig != oldWidget._themeConfig;
}
