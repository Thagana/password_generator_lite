// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:password_repository/password_repository.dart';

void main() {
  group('PasswordRepository', () {
    test('can be instantiated', () {
      expect(PasswordRepository(), isNotNull);
    });
  });
}
