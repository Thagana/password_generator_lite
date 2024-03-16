part of 'password_bloc.dart';

///
abstract class PasswordState extends Equatable {
  ///
  const PasswordState();
  @override
  List<Object> get props => [];

  ///
  List<Password> get passwords => [];

  ///
  Map<String, dynamic>? toJson() {
    return null;
  }
}

///
class PasswordInitial extends PasswordState {
  ///
  const PasswordInitial();
}

///
class PasswordError extends PasswordState {
  ///
  const PasswordError({required this.message});

  ///
  final String? message;
}

///
class PasswordLoaded extends PasswordState {
  ///
  const PasswordLoaded({required this.passwords});

  ///
  @override
  final List<Password> passwords;
}


class SavePasswordSuccessful extends PasswordState {
  const SavePasswordSuccessful({ required this.passwords });

  @override
  final List<Password> passwords;
}

class SavePasswordError extends PasswordState {
  const SavePasswordError({ required this.message });

  final String message;
}