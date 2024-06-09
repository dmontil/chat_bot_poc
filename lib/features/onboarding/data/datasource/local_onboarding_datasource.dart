import 'package:chat_bot_poc/locator.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:chat_bot_poc/shared/storage/local_storage_service.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@real
@dev
@singleton
class LocalOnboardingDatasource {
  LocalOnboardingDatasource(this._localStorageService);

  final LocalStorageService _localStorageService;

  Future<Either<Failure, void>> setOnboardingCompleted() async {
    try {
      _localStorageService.setOnboardingCompleted();
      return const Right(null);
    } on () {
      return Left(UnknownFailure());
    }
  }

  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final result = _localStorageService.isOnboardingCompleted();
      return Right(result);
    } on () {
      return Left(UnknownFailure());
    }
  }
}
