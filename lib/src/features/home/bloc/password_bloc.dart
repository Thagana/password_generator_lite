import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:password_repository/password_repository.dart';

part 'password_event.dart';

part 'password_state.dart';

///
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  ///
  PasswordBloc({required this.passwordRepository})
      : super(const PasswordState()) {
    on<RequestDelete>(_requestDeletePassword);
    on<RequestPasswords>(_requestPasswords);
    on<RequestAddPassword>(_requestAddPassword);
  }

  ///
  final PasswordRepository passwordRepository;

  Future<void> _requestAddPassword(
    RequestAddPassword event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      await passwordRepository.savePassword(
        event.password,
        event.name,
        event.strength,
        event.plainPassword,
      );

      final passwords = await passwordRepository.getPasswords();

      emit(state.copyWith(passwords: passwords));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(errorMessage: 'Something went wrong please try again'),
      );
    }
  }

  Future<void> _requestPasswords(
    RequestPasswords event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      final passwords = await passwordRepository.getPasswords();
      emit(state.copyWith(passwords: passwords));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(errorMessage: 'Something went wrong please try again'),
      );
    }
  }

  Future<void> _requestDeletePassword(
    RequestDelete event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      await passwordRepository.deletePassword(event.password);
      final passwords = await passwordRepository.getPasswords();
      emit(state.copyWith(passwords: passwords));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        state.copyWith(errorMessage: 'Something went wrong please try again'),
      );
    }
  }
}
