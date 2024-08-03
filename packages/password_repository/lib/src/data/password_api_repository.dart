import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:password_repository/password_repository.dart';
import 'package:password_repository/src/models/password.dart';
import 'package:password_repository/src/utils/date.dart';

///
class PasswordApiProvider {
  ///
  Future<List<Password>> getPasswords() async {
    try {
      final user = getCurrentUser();

      if (user != null) {
        final database = FirebaseDatabase.instance.ref();
        final snapshot =
            await database.child('users/${user.uid}/passwords').get();

        if (snapshot.value != null) {
          final passwords = <Password>[];
          for (final item in snapshot.value! as List) {
            final password = Password(
                password: item['password'] as String,
                date: item['date'] as String,
                name: item['name'] as String,
                logo: item['logo'] as String,
                strength: item['strength'] as double);
            passwords.add(password);
          }
          return passwords;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load inventories');
    }
  }

  ///
  User? getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to get user');
    }
  }

  ///
  String encriptPassword(String password) {
    final key = Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64;
  }

  ///
  Future<void> savePassword(
    String password,
    String name,
    double strength,
    String plainPassword,
  ) async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final database = FirebaseDatabase.instance;
        final snapshot =
            await database.ref().child('users/${user.uid}/passwords').get();

        final date = getTodayDate();
        final toSavePassword = encriptPassword(password);

        final passwordSave = {
          'password': toSavePassword,
          'date': date,
          'name': name,
          'logo':
              'https://avatars.githubusercontent.com/u/68122202?s=400&u=4abc9827a8ca8b9c19b06b9c5c7643c87da51e10&v=4',
          'strength': strength
        };

        if (snapshot.value != null) {
          final passwords = <Map<String, dynamic>>[];
          for (final item in snapshot.value! as List) {
            final password = {
              'password': item['password'] as String,
              'date': item['date'] as String,
              'name': item['name'] as String?,
              'logo': item['logo'] as String?,
              'strength': item['strength'] as int?,
            };
            passwords.add(password);
          }
          passwords.add(passwordSave);
          await database
              .ref('users/${user.uid}')
              .update({'passwords': passwords});
        } else {
          await database.ref('users/${user.uid}').set({
            'passwords': [passwordSave],
          });
        }
      }
    } catch (e, stacktrace) {
      print('Error: $e Stacktrace: $stacktrace');
      throw Exception('Failed to add password locally');
    }
  }

  ///
  Future<void> deletePassword(String password) async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final database = FirebaseDatabase.instance;
        final snapshot =
            await database.ref().child('users/${user.uid}/passwords').get();
        if (snapshot.value != null) {
          final passwords = <Map<String, dynamic>>[];
          for (final item in snapshot.value! as List) {
            final password = {
              'password': item['password'] as String,
              'date': item['date'] as String,
              'name': item['name'] as String?,
              'logo': item['logo'] as String?,
              'strength': item['strength'] as int?,
            };
            passwords.add(password);
          }
          passwords.removeWhere((element) => element['password'] == password);
          await database
              .ref('users/${user.uid}')
              .update({'passwords': passwords});
        }
      }
    } catch (e, stacktrace) {
      print('Error: $e Stacktrace: $stacktrace');
      throw Exception('Failed to add password locally');
    }
  }
}
