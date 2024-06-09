import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    bool? onboardingShowed,
  }) = _OnboardingState;

  factory OnboardingState.initial() {
    return OnboardingState(
      onboardingShowed: false,
    );
  }
}
