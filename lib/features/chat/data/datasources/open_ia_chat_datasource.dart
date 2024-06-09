import 'dart:convert';

import 'package:chat_bot_poc/environment_manager.dart';
import 'package:chat_bot_poc/features/chat/data/dtos/chat_dto.dart';
import 'package:chat_bot_poc/features/chat/domain/models/chat_item.dart';
import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@real
@dev
@singleton
class OpenIaChatDatasource {
  OpenIaChatDatasource();

  Future<Either<Failure, ChatDto>> sendRequest(
    String userInput,
  ) async {
    try {
      final systemMessage = _createSystemMessage();
      final userMessage = _createUserMessage(userInput);

      OpenAI.apiKey = envString('OPEN_IA_API_KEY');
      final requestMessages = [
        systemMessage,
        userMessage,
      ];
      final chatCompletion = await _createChatRequest(requestMessages);

      final jsonResponse =
          jsonDecode(chatCompletion.choices.first.message.content!.first.text!);

      final chatItems = (jsonResponse['ranking'] as List)
          .map((e) => ChatItem.fromJson(e as Map<String, dynamic>))
          .toList();

      return Right(ChatDto(chatItems: chatItems));
    } on Exception {
      return Left(UnknownFailure());
    }
  }

  Future<OpenAIChatCompletionModel> _createChatRequest(
      List<OpenAIChatCompletionChoiceMessageModel> requestMessages) {
    return OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo-1106',
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );
  }
}

OpenAIChatCompletionChoiceMessageModel _createUserMessage(String userInterest) {
  final prompt = 'Devuelve el top 5 sobre $userInterest.\n';
  return OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
    ],
    role: OpenAIChatMessageRole.user,
  );
}

OpenAIChatCompletionChoiceMessageModel _createSystemMessage() {
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        '''
No incluya ninguna explicación, sólo proporcione una respuesta JSON conforme a RFC8259 siguiendo este formato sin desviaciones únicamente donde pone Link agrega una url valida que tenga información relacionada con el titulo.Y un maximo de 2000 caracteres en total toda la respuesta.
El Key del json siempre en ingles y el valor siempre en español
{
  "ranking": [
    {
      "position": 1,
      "title": "Título del elemento 1",
      "description": "Descripción breve del elemento 1",
      "link": ""
    },
    {
      "position": 2,
      "title": "Título del elemento 2",
      "description": "Descripción breve del elemento 2",
      "link": ""
    },
    {
      "position": 3,
      "title": "Título del elemento 3",
      "description": "Descripción breve del elemento 3",
      "link": ""
    },
    {
      "position": 4,
      "title": "Título del elemento 4",
      "description": "Descripción breve del elemento 4",
      "link": ""
    },
    {
      "position": 5,
      "title": "Título del elemento 5",
      "description": "Descripción breve del elemento 5",
      "link": ""
    }
  ]
}
''',
      )
    ],
    role: OpenAIChatMessageRole.assistant,
  );
  return systemMessage;
}
