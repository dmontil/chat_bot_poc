import 'package:chat_bot_poc/features/chat/domain/models/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default([]) List<ChatMessage> messages,
    String? errorMessage,
  }) = _ChatState;
}
