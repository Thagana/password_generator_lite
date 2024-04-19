import 'package:flutter/foundation.dart';
import 'package:password_repository/password_repository.dart';
import 'package:password_repository/src/data/database.dart';
import 'package:password_repository/src/models/password.dart';
import 'package:password_repository/src/utils/date.dart';

///
class PasswordApiProvider {
  ///
  final dbProvider = DatabaseProvider.dbProvider;

  ///
  Future<List<Password>> getPasswords() async {
    try {
      final db = await dbProvider.database;

      final query = await db.query('passwords');

      return query.map(Password.fromJson).toList();
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
      final db = await dbProvider.database;

      await db
          .rawDelete('DELETE FROM passwords WHERE password = ?', [password]);

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
      final db = await dbProvider.database;

      final data = getTodayDate();

      await db.insert(
        'passwords',
        Password(password: password, date: data).toMap(),
      );

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to add password locally');
    }
  }
}
