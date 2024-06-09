import 'package:chat_bot_poc/features/chat/data/datasources/gemini_chat_datasource.dart';
import 'package:chat_bot_poc/features/chat/data/datasources/open_ia_chat_datasource.dart';
import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/data/repositories/chat_repository.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:chat_bot_poc/features/chat/domain/repositories/chat_repository.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOpenIAChatDatasource extends Mock implements OpenIaChatDatasource {}

class MockGeminiChatDatasource extends Mock implements GemminiChatDatasource {}

void main() {
  late OpenIaChatDatasource openIaDatasource;
  late GemminiChatDatasource geminiDatasource;
  late ChatRepository repository;
  const chatDto = ChatDto(
    chatItems: [
      ChatItem(
          position: 1, title: 'title', description: 'description', link: '')
    ],
  );
  setUp(() {
    openIaDatasource = MockOpenIAChatDatasource();
    geminiDatasource = MockGeminiChatDatasource();
    repository = ChatRepositoryImpl(openIaDatasource, geminiDatasource);
  });

  group('sendRequest', () {
    test('get success response', () async {
      when(() => openIaDatasource.sendRequest(
            'hello',
          )).thenAnswer((_) async => const Right(chatDto));

      final result = await repository.sendRequest('hello', ChatProvider.openIA);

      expect(result.isRight, true);
      expect(result.right, chatDto);
    });

    test('get response  failure', () async {
      when(() => openIaDatasource.sendRequest(
            'hello',
          )).thenAnswer((_) async => Left(UnknownFailure()));

      final result = await repository.sendRequest('hello', ChatProvider.openIA);

      expect(result.isLeft, true);
      expect(result.left, isA<UnknownFailure>());
    });
  });
}
