import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:password_repository/password_repository.dart';
import 'package:password_repository/src/models/password.dart';

import '../utils/date.dart';


///
class PasswordApiProvider {
  ///
  Future<List<Password>> getPasswords() async {
    try {
      final box = await Hive.openBox<String>('passwords');
      final passwordBox = box.get('passwords');
      if (passwordBox != null) {
        final passwords = Password.decode(passwordBox);
        return passwords;
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load inventories');
    }
  }

  ///
  Future<List<Password>> savePassword(String password) async {
    try {
      final box = await Hive.openBox<String>('passwords');
      final passwordBox = box.get('passwords');
      final date = getTodayDate();

      if (passwordBox == null) {
        final temp = <Password>[];

        temp.add(Password(password: password, date: date));

        final passwords = Password.encode(temp);

        await box.put('passwords', passwords);
        return temp;
      } else {
        final temp = <Password>[];
        final passwords = Password.decode(passwordBox);
        temp..add(Password(password: password, date: date))
        ..addAll(passwords);
        await box.put('passwords', Password.encode(temp));
        return temp;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to add password locally');
    }
  }
}
