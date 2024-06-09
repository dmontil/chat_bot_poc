import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_message.dart';
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_state.dart';
import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/i18n/translations.g.dart';
import 'package:chat_bot_poc/shared/ui/design/border_radius.dart';
import 'package:chat_bot_poc/shared/ui/design/spacings.dart';
import 'package:chat_bot_poc/shared/ui/design/text_styles.dart';
import 'package:chat_bot_poc/shared/ui/design/theme/theme_provider.dart';
import 'package:chat_bot_poc/shared/ui/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({@pathParam required this.chatProvider, super.key});
  final int chatProvider;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.getIt<ChatCubit>(param1: chatProvider),
      child: ChatView(chatProvider: ChatProvider.values[chatProvider]),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({required this.chatProvider, super.key});
  final ChatProvider chatProvider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: chatProvider == ChatProvider.openIA
                  ? context.colors.secondary
                  : context.colors.tertiary),
        ),
        body: BlocConsumer<ChatCubit, ChatState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage != null) {
              context.showErrorSnackBar(message: state.errorMessage!);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        spacings.y.s20,
                        Center(
                          child: Chip(
                            side: BorderSide.none,
                            elevation: 0,
                            backgroundColor: chatProvider == ChatProvider.openIA
                                ? context.colors.secondary
                                : context.colors.tertiary,
                            label: Text(chatProvider.name.toUpperCase()),
                          ),
                        ),
                        ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final chatMessage = state.messages[index];
                            return Padding(
                              padding: paddings.y.s4,
                              child: MessageBubble(
                                message: chatMessage,
                                chatProvider: chatProvider,
                              ),
                            );
                          },
                        ),
                        if (state.isLoading)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: CircularProgressIndicator(
                              color: chatProvider == ChatProvider.openIA
                                  ? context.colors.secondary
                                  : context.colors.tertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                MessageInput(
                  chatProvider: chatProvider,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {required this.message, required this.chatProvider, super.key});
  final ChatMessage message;
  final ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message is UserMessage;
    final alignment =
        isUserMessage ? Alignment.centerRight : Alignment.centerLeft;
    final margin = isUserMessage
        ? const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 12)
        : const EdgeInsets.only(right: 16, top: 4, bottom: 4);
    final color = isUserMessage
        ? chatProvider == ChatProvider.openIA
            ? context.colors.yellowDark
            : context.colors.userMessage
        : Colors.transparent;
    final backgroundCardItemColor = chatProvider == ChatProvider.openIA
        ? context.colors.yellowLight
        : context.colors.primary;

    return Align(
      alignment: alignment,
      child: Container(
        padding: paddings.all.s8,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius.superLow,
        ),
        child: message.when(
          userMessage: (userMessage) => Text(
            userMessage,
          ),
          botMessage: (botMessage) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  color: backgroundCardItemColor,
                  elevation: 2,
                  child: Padding(
                      padding: paddings.all.s8,
                      child: Text(
                        t.presentation.chat.title,
                      ))),
              ...botMessage.map((chatItem) => ChatItemCard(
                  chatItem: chatItem,
                  backgroundColor: backgroundCardItemColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  const MessageInput({required this.chatProvider, super.key});

  final ChatProvider chatProvider;

  @override
  MessageInputState createState() => MessageInputState();
}

class MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();
  late final ValueNotifier<String> _textNotifier;

  @override
  void initState() {
    super.initState();
    _textNotifier = ValueNotifier(_controller.text);
    _controller.addListener(() {
      _textNotifier.value = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _textNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);

    final color = widget.chatProvider == ChatProvider.openIA
        ? context.colors.secondary
        : context.colors.tertiary;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              cursorColor: color,
              style: TextStyle(color: context.colors.base),
              decoration: InputDecoration(
                hintText: t.presentation.chat.writeRanking,
                hintStyle: TextStyle(color: context.colors.base),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: color,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: color),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<String>(
            valueListenable: _textNotifier,
            builder: (context, String value, _) {
              return IconButton(
                icon: const Icon(Icons.send),
                color: value.trim().isEmpty ? color.withOpacity(0.4) : color,
                onPressed: () {
                  final message = value.trim();
                  if (message.isNotEmpty) {
                    _controller.clear();
                    cubit.sendMessage(message);
                    FocusScope.of(context).unfocus();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class ChatItemCard extends StatelessWidget {
  const ChatItemCard(
      {required this.chatItem, required this.backgroundColor, super.key});
  final ChatItem chatItem;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 2,
      child: Padding(
        padding: paddings.all.s8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '${chatItem.position}: ${chatItem.title}',
                    style: textStyles.h3,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.link,
                    color: context.colors.background,
                  ),
                  onPressed: () async {
                    final Uri uri = Uri.parse(chatItem.link);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      if (context.mounted) {
                        context.showErrorSnackBar(
                          message: t.presentation.chat.errorLink,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
            Text(
              chatItem.description,
            ),
          ],
        ),
      ),
    );
  }
}
