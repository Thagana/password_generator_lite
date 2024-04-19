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
  const RequestAddPassword({required this.password});
  final String password;

  @override
  List<Object?> get props => [password];
}

///
class RequestSavePassword extends PasswordEvent {
  const RequestSavePassword({ required this.password });
  final String password;
  @override
  List<Object?> get props => [password];
}

///
class RequestDelete extends PasswordEvent {
  const RequestDelete({ required this.password});
  final String password;
  List<Object?> get props => [password];
}
