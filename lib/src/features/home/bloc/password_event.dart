part of 'password_bloc.dart';

///
abstract class PasswordEvent {
  ///
  const PasswordEvent();
}

///
class RequestPasswords extends PasswordEvent {
  ///
  const RequestPasswords();
}

class RequestAddPassword extends PasswordEvent {
  const RequestAddPassword({
    required this.password,
    required this.name,
    required this.strength,
    required this.plainPassword,
  });

  final String password;
  final String name;
  final double strength;
  final String plainPassword;

  List<Object?> get props => [password, name, strength, plainPassword];
}

///
class RequestSavePassword extends PasswordEvent {
  const RequestSavePassword({required this.password});

  final String password;

  List<Object?> get props => [password];
}

///
class RequestDelete extends PasswordEvent {
  const RequestDelete({required this.password});

  final String password;

  List<Object?> get props => [password];
}
