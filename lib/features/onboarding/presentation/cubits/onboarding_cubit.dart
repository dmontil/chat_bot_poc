import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_bot_poc/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:chat_bot_poc/features/onboarding/presentation/cubits/onboarding_state.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(
    this._onboardingRepository,
  ) : super(OnboardingState.initial());

  final OnboardingRepository _onboardingRepository;

  Future<void> setOnboardingCompleted() async {
    await _onboardingRepository.setOnboardingCompleted();
  }

  Future<void> load() async {
    await _onboardingRepository.isOnboardingCompleted().mapRight((isCompleted) {
      emit(
        state.copyWith(onboardingShowed: isCompleted),
      );
    });
  }
}
