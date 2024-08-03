import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<SignInWithGoogle>(_signInWithGoogle);
  }

  final AuthRepository authRepository;

  Future<void> _signInWithGoogle(
      SignInWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(
        state.copyWith(loading: true),
      );
      final response = await authRepository.signInWithGoogle();
      if (response != null) {
        emit(
          state.copyWith(
            success: true,
            credentials: response,
            loading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            success: false,
            errorMessage: 'Something went wrong please try again later',
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
          success: false,
          errorMessage: 'Something went wrong please try again later!',
          loading: false,
        ),
      );
    }
  }
}
