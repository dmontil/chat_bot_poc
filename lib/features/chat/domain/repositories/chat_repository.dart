import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatDto>> sendRequest(
      String userInput, ChatProvider chatProvider);
}
