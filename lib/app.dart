import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/router/router.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class App extends StatelessWidget {
  App({
    bool isOnboardingCompleted = false,
    super.key,
  }) : router = AppRouter(isOnboardingCompleted: isOnboardingCompleted);

  @visibleForTesting
  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;

    initializeDateFormatting(locale.languageCode);
    Intl.defaultLocale = locale.languageCode;

    return GetItProvider(
        getIt: getIt,
        child: MaterialApp.router(
          locale: locale,
          theme: AppTheme.of(context).isLight ? themeLight : themeDark,
          routerConfig: router.config(
            navigatorObservers: () => [],
          ),
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: t.common.appName,
        ));
  }
}
