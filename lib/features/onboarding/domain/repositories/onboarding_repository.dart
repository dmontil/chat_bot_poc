import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> setOnboardingCompleted();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
