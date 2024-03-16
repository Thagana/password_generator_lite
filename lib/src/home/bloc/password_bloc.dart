import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:password_repository/password_repository.dart';

part 'password_event.dart';

part 'password_state.dart';

///
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  ///
  PasswordBloc({required this.passwordRepository})
      : super(const PasswordInitial()) {
    on<RequestSavePassword>(_requestSavePassword);
    on<RequestPasswords>(_requestPasswords);
  }

  ///
  final PasswordRepository passwordRepository;

  ///
  Future<void> _requestSavePassword(
    RequestSavePassword event,
    Emitter<PasswordState> emit,
  ) async {
    try {
      final passwords = await passwordRepository.savePassword(event.password);
      emit(SavePasswordSuccessful(passwords: passwords));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(
        SavePasswordError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _requestPasswords(
      RequestPasswords event,
      Emitter<PasswordState> emit
      ) async {
    try {
      final passwords = await passwordRepository.getPasswords();
      emit(PasswordLoaded(passwords: passwords));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      emit(
        SavePasswordError(
          message: error.toString(),
        ),
      );
    }
  }
}
