import 'package:chat_bot_poc/features/onboarding/data/datasource/local_onboarding_datasource.dart';
import 'package:chat_bot_poc/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(
    this._onboardingLocalDatasource,
  );

  final LocalOnboardingDatasource _onboardingLocalDatasource;

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    return _onboardingLocalDatasource.isOnboardingCompleted();
  }

  @override
  Future<Either<Failure, void>> setOnboardingCompleted() {
    return _onboardingLocalDatasource.setOnboardingCompleted();
  }
}
