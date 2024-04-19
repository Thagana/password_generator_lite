import 'package:password_repository/password_repository.dart';

///
class PasswordDelete {
  ///
  const PasswordDelete({
    required this.success,
    this.passwords,
    this.message,
  });

  ///
  final bool success;

  ///
  final List<Password>? passwords;

  ///
  final String? message;
}
