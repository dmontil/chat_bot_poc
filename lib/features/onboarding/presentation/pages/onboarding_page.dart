import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_state.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/widgets/start_button.dart';
import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/ui/design/spacings.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.getIt<OnboardingCubit>(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              spacings.y.s20,
              _AssistantChip(),
              _Content(),
              spacings.y.s20,
              const StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset('assets/icons/texture.svg',
            fit: BoxFit.cover,
            height: size.height * 0.7,
            width: size.width,
            colorFilter: ColorFilter.mode(
                context.colors.base.withOpacity(0.2), BlendMode.srcIn)),
        Positioned(
            top: size.height * 0.35,
            left: size.width * 0.4 - 75,
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondary,
                boxShadow: [
                  BoxShadow(
                    color: context.colors.secondary,
                    blurRadius: 150,
                    spreadRadius: 80,
                  ),
                ],
              ),
            )),
        Positioned(
            top: size.height * 0.1,
            left: size.width * 0.3,
            child: SvgPicture.asset('assets/icons/robot.svg')),
        Positioned(
            top: size.height * 0.6,
            child: Container(
              padding: paddings.x.s16,
              width: size.width,
              child: Text(t.presentation.onboarding.rankingHelp,
                  style: TextStyle(color: context.colors.base, fontSize: 25)),
            )),
      ],
    );
  }
}

class _AssistantChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        side: BorderSide.none,
        backgroundColor: context.colors.secondary,
        label: Text(t.presentation.onboarding.assistant),
      ),
    );
  }
}
