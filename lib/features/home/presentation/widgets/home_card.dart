import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/shared/ui/design/spacings.dart';
import 'package:chat_bot_poc/shared/ui/design/text_styles.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.text,
    required this.color,
    required this.chatProvider,
    super.key,
  });
  final String text;
  final Color color;
  final ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.router.pushNamed('/chat/${chatProvider.index}'),
        child: Card(
          color: color,
          elevation: 5,
          child: Padding(
            padding: paddings.all.s16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor:
                          context.colors.background.withOpacity(0.2),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        size: 20,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_rounded),
                  ],
                ),
                const Spacer(),
                Text(text, style: textStyles.h2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
