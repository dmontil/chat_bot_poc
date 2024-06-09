import 'package:chat_bot_poc/features/chat/data/datasources/gemini_chat_datasource.dart';
import 'package:chat_bot_poc/features/chat/data/datasources/open_ia_chat_datasource.dart';
import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/domain/enums/chat_provider.dart';
import 'package:chat_bot_poc/features/chat/domain/repositories/chat_repository.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(
    this._openIaChatDatasource,
    this._gemminiChatDatasource,
  );

  final OpenIaChatDatasource _openIaChatDatasource;
  final GemminiChatDatasource _gemminiChatDatasource;

  @override
  Future<Either<Failure, ChatDto>> sendRequest(
      String userInput, ChatProvider chatProvider) async {
    switch (chatProvider) {
      case ChatProvider.openIA:
        return _openIaChatDatasource.sendRequest(userInput);
      case ChatProvider.gemini:
        return _gemminiChatDatasource.sendRequest(userInput);
      default:
        return Left(UnknownFailure());
    }
  }
}
