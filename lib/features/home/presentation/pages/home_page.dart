import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/home/presentation/widgets/home_card.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/ui/design/spacings.dart';
import 'package:chat_bot_poc/shared/ui/design/text_styles.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppTheme.of(context).toggle();
          },
          child: Icon(AppTheme.of(context).isLight
              ? Icons.dark_mode
              : Icons.light_mode),
        ),
        body: const Stack(
          children: [
            _Background(),
            _Title(),
            _Cards(),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: -50,
      left: size.width * 0.25,
      child: SvgPicture.asset('assets/icons/texture_2.svg',
          fit: BoxFit.cover,
          height: size.height * 0.35,
          width: size.width,
          colorFilter: ColorFilter.mode(
              context.colors.base.withOpacity(0.2), BlendMode.srcIn)),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.1,
      child: Container(
        margin: paddings.x.s16,
        width: size.width * 0.6,
        child: Text(
          t.presentation.home.title,
          style: textStyles.h1.copyWith(color: context.colors.textColor),
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.3,
      child: SizedBox(
        height: size.height * 0.25,
        width: size.width,
        child: Row(
          children: [
            HomeCard(
              text: t.presentation.home.talkToOpenIa,
              color: context.colors.secondary,
              chatProvider: ChatProvider.openIA,
            ),
            HomeCard(
              text: t.presentation.home.talkToGemini,
              color: context.colors.tertiary,
              chatProvider: ChatProvider.gemini,
            ),
          ],
        ),
      ),
    );
  }
}
