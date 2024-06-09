import 'dart:convert';

import 'package:chat_bot_poc/environment_manager.dart';
import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@real
@dev
@singleton
class GemminiChatDatasource {
  GemminiChatDatasource();
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: envString('GEMINI_API_KEY'),
  );
  Future<Either<Failure, ChatDto>> sendRequest(
    String userInput,
  ) async {
    final systemMessage = _createSystemMessage();
    final userMessage = _createUserMessage(userInput);

    try {
      final requestMessages = [
        systemMessage,
        userMessage,
      ];
      final chatCompletion = await _createChatRequest(requestMessages);

      final jsonResponse = jsonDecode(chatCompletion.text ?? '');
      final chatItems = (jsonResponse['ranking'] as List)
          .map((e) => ChatItem.fromJson(e as Map<String, dynamic>))
          .toList();

      return Right(ChatDto(chatItems: chatItems));
    } on () {
      return Left(UnknownFailure());
    }
  }

  Future<GenerateContentResponse> _createChatRequest(
      List<Content> requestMessages) async {
    return model.generateContent(requestMessages);
  }
}

Content _createUserMessage(String userInterest) {
  final prompt = 'Devuelve el top 5 sobre $userInterest.\n';
  return Content.text(prompt);
}

Content _createSystemMessage() {
  final systemMessage = Content.text('''
          No incluya ninguna explicación, sólo proporcione una respuesta JSON conforme a RFC8259 siguiendo este formato sin desviaciones.Y un maximo de 2000 caracteres en total toda la respuesta.
El Key del json siempre en ingles y el valor siempre en español
{
  "ranking": [
    {
      "position": 1,
      "title": "Título del elemento 1",
      "description": "Descripción breve del elemento 1",
      "link": "https://link-to-more-info.com/1",
    },
    {
      "position": 2,
      "title": "Título del elemento 2",
      "description": "Descripción breve del elemento 2",
      "link": "https://link-to-more-info.com/2",
    },
    {
      "position": 3,
      "title": "Título del elemento 3",
      "description": "Descripción breve del elemento 3",
      "link": "https://link-to-more-info.com/3",
    },
    {
      "position": 4,
      "title": "Título del elemento 4",
      "description": "Descripción breve del elemento 4",
      "link": "https://link-to-more-info.com/4",
    },
    {
      "position": 5,
      "title": "Título del elemento 5",
      "description": "Descripción breve del elemento 5",
      "link": "https://link-to-more-info.com/5",
    }
  ]
}''');
  return systemMessage;
}
