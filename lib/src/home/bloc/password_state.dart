part of 'password_bloc.dart';

///
class PasswordState {
  ///
  const PasswordState({
    this.passwords = const [],
    this.errorMessage = '',
  });

  final String errorMessage;
  final List<Password> passwords;

  ///
  Map<String, dynamic>? toJson() {
    return {
      'passwords': passwords,
      'errorMessage': errorMessage,
    };
  }

  PasswordState copyWith({List<Password>? passwords, String? errorMessage}) {
    return PasswordState(
      passwords: passwords ?? this.passwords,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [errorMessage, passwords];
}
