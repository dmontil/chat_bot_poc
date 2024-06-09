import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_bot_poc/app.dart';
import 'package:chat_bot_poc/environment_manager.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/bloc_debug_observer.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await EnvironmentManager().load();
  if (kDebugMode) {
    Bloc.observer = const BlocDebugObserver();
  }
  await configureDependencies();
  final onboardingCubit = getIt<OnboardingCubit>();
  await onboardingCubit.load();
  runApp(TranslationProvider(
    child: AppThemeProvider(
        child: App(
      isOnboardingCompleted: onboardingCubit.state.onboardingShowed ?? false,
    )),
  ));
}
