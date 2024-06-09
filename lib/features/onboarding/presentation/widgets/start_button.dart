import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/ui/design/spacings.dart';
import 'package:chat_bot_poc/shared/ui/design/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.x.s16,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.read<OnboardingCubit>().setOnboardingCompleted();
            context.router.pushNamed('/home');
          },
          child: Text(
            t.presentation.onboarding.start,
            style: textStyles.body,
          ),
        ),
      ),
    );
  }
}
