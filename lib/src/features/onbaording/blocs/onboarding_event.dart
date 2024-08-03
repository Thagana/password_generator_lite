part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class RequestPasswordAdd extends OnboardingEvent {
  const RequestPasswordAdd(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class RequestOnboardingState extends OnboardingEvent {
  const RequestOnboardingState();
  @override
  List<Object> get props => [];
}
