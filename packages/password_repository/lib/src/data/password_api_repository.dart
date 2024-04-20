import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:password_repository/password_repository.dart';
import 'package:password_repository/src/models/password.dart';
import 'package:password_repository/src/utils/date.dart';

///
class PasswordApiProvider {
  ///
  static final key = Hive.generateSecureKey();

  ///
  Future<List<Password>> getPasswords() async {
    try {
      final collection = await BoxCollection.open(
        'CybermanBox',
        {'passwords', 'settings'},
        path: './',
        key: HiveAesCipher(key),
      );

      final passwordsBox = await collection.openBox('passwords');

      final passwords = await passwordsBox.get('passwords') as List<dynamic>?;

      if (passwords == null) {
        return [];
      }

      final passwordList = passwords
          .map(
            (val) => Password(
              password: val['password'] as String,
              date: val['date'] as String,
            ),
          )
          .toList();

      return passwordList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load inventories');
    }
  }

  ///
  Future<void> deletePassword(String password) async {
    try {
      final collection = await BoxCollection.open(
        'CybermanBox',
        {'passwords', 'settings'},
        path: './',
        key: HiveAesCipher(key),
      );

      final passwordsBox = await collection.openBox('passwords');

      final passwords = await passwordsBox.get('passwords') as List<dynamic>?;

      if (passwords == null) return;

      passwords.removeWhere((val) => val['password'] == password);

      await passwordsBox.put('passwords', [...passwords]);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Exception('Failed to delete password');
    }
  }

  ///
  Future<void> savePassword(String password) async {
    try {
      final data = getTodayDate();

      final passwordSave = Password(password: password, date: data).toMap();

      final collection = await BoxCollection.open(
        'CybermanBox',
        {'passwords', 'settings'},
        path: './',
        key: HiveAesCipher(key),
      );

      final passwordsBox = await collection.openBox('passwords');

      final passwords = await passwordsBox.get('passwords') as List<dynamic>?;

      if (passwords == null) {
        await passwordsBox.put('passwords', [passwordSave]);
        return;
      }
      ;

      await passwordsBox.put('passwords', [...passwords, passwordSave]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to add password locally');
    }
  }
}
