import 'package:bloc_test/bloc_test.dart';
import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:chat_bot_poc/features/chat/domain/repositories/chat_repository.dart';
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:chat_bot_poc/features/chat/presentation/cubits/chat_state.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late ChatRepository chatRepository;
  late ChatCubit cubit;

  const chatProvider = ChatProvider.openIA;
  setUp(() {
    chatRepository = MockChatRepository();
    cubit = ChatCubit(
      chatProvider.index,
      chatRepository,
    );
  });

  const chatDto = ChatDto(
    chatItems: [
      ChatItem(
          position: 1, title: 'title', description: 'description', link: '')
    ],
  );

  test('initial state', () {
    expect(cubit.state, const ChatState());
  });

  blocTest<ChatCubit, ChatState>(
    'success send message',
    build: () => cubit,
    setUp: () => when(() => chatRepository.sendRequest('Hello', chatProvider))
        .thenAnswer((_) async => Right(chatDto)),
    act: (cubit) => cubit.sendMessage('Hello'),
    expect: () => [
      predicate<ChatState>((state) => state.isLoading),
      predicate<ChatState>(
          (state) => !state.isLoading && state.messages.length == 2),
    ],
  );

  blocTest<ChatCubit, ChatState>(
    'error send message',
    build: () => cubit,
    setUp: () => when(() => chatRepository.sendRequest('Hello', chatProvider))
        .thenAnswer((_) async => Left(UnknownFailure())),
    act: (cubit) => cubit.sendMessage('Hello'),
    expect: () => [
      predicate<ChatState>((state) => state.isLoading),
      predicate<ChatState>(
          (state) => !state.isLoading && state.errorMessage != null),
    ],
  );
}
