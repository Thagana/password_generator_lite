import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:onboarding_repository/onboarding_repository.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required this.onboardingRepository})
      : super(const OnboardingState()) {
    on<RequestPasswordAdd>(_requestAddMainPassword);
    on<RequestOnboardingState>(_requestOnboardingState);
  }

  final OnboardingRepository onboardingRepository;

  Future <void> _requestOnboardingState(
    RequestOnboardingState event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      final response = await onboardingRepository.getPassword();
      if (response.success) {
        emit(state.copyWith(isDone: true, password: response.password));
      } else {
        emit(state.copyWith(isDone: false));
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(state.copyWith(isDone: false));
    }
  }

  Future<void> _requestAddMainPassword(
    RequestPasswordAdd event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final response =
          await onboardingRepository.saveMainPassword(event.password);
      if (response.success) {
        emit(
          state.copyWith(
              loading: false, isDone: true, password: response.password),
        );
      } else {
        emit(
          state.copyWith(
            errorMessage: 'Failed to save password',
            loading: false,
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(
            errorMessage: 'Something went wrong please try again',
            loading: false),
      );
    }
  }
}
