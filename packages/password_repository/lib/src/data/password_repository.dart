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
  Future<List<Password>> savePassword(String password) {
    return _provider.savePassword(password);
  }
}
