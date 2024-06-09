import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_message.dart';
import 'package:chat_bot_poc/features/chat/domain/repositories/chat_repository.dart';
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_state.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    @factoryParam this._chatProvider,
    this._chatRepository,
  ) : super(const ChatState());

  final ChatRepository _chatRepository;
  final int _chatProvider;
  Future<void> sendMessage(String userInput) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        messages: [
          ...state.messages,
          ChatMessage.userMessage(message: userInput),
        ],
      ),
    );

    await _chatRepository
        .sendRequest(userInput, ChatProvider.values[_chatProvider])
        .fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              messages: [
                ...state.messages,
              ],
              errorMessage: failure.message,
            ),
          ),
          (chatDto) => emit(
            state.copyWith(
              isLoading: false,
              messages: [
                ChatMessage.botMessage(messages: chatDto.chatItems),
                ...state.messages,
              ],
            ),
          ),
        );
  }
}
