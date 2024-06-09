import 'package:chat_bot_poc/shared/i18n/translations.g.dart';

sealed class Failure {
  String get message => t.common.failures.unknown;
}

class GenericFailure extends Failure {
  GenericFailure({
    String? message,
  }) : _message = message;

  final String? _message;

  @override
  String get message => _message ?? super.message;
}

class UnknownFailure extends Failure {}

class ConnectionFailure extends Failure {
  @override
  String get message => t.common.failures.connection;
}
