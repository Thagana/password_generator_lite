part of 'password_bloc.dart';

///
class PasswordState {
  ///
  const PasswordState({
    this.passwords = const [],
    this.errorMessage = '',
    this.plainPassword = '',
  });

  final String errorMessage;
  final List<Password> passwords;
  final String plainPassword;

  ///
  Map<String, dynamic>? toJson() {
    return {
      'passwords': passwords,
      'errorMessage': errorMessage,
      'plainPassword': plainPassword
    };
  }

  PasswordState copyWith({
    List<Password>? passwords,
    String? errorMessage,
    String? plainPassword,
  }) {
    return PasswordState(
      passwords: passwords ?? this.passwords,
      errorMessage: errorMessage ?? this.errorMessage,
      plainPassword: plainPassword ?? this.plainPassword,
    );
  }

  List<Object?> get props => [errorMessage, passwords, plainPassword];
}
