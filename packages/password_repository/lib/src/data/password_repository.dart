import 'package:password_repository/src/data/password_api_repository.dart';
import 'package:password_repository/src/models/password.dart';

///
class PasswordRepository {
  final _provider = PasswordApiProvider();

  ///
  Future<List<Password>> getPasswords() {
    return _provider.getPasswords();
  }

  ///
  Future<void> savePassword(
    String password,
    String name,
    double strength,
    String plainPassword,
  ) async {
    await _provider.savePassword(password, name, strength, plainPassword);
  }

  ///
  Future<void> deletePassword(String password) async {
    await _provider.deletePassword(password);
  }
}
