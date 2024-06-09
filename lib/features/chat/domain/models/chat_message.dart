import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

@freezed
class ChatMessage with _$ChatMessage {
  factory ChatMessage.userMessage({
    required String message,
  }) = UserMessage;

  factory ChatMessage.botMessage({
    required List<ChatItem> messages,
  }) = BotMessage;
}
