import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import 'package:onboarding_repository/src/models/index.dart';

///
class OnboardingApiProvider {
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
  String encryptString(String password) => base64UrlEncode(
        utf8.encode(
          sha256.convert(utf8.encode(password)).toString(),
        ),
      );

  ///
  Future<SavePasswordResponse> saveMainPassword(String password) async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final db = FirebaseDatabase.instance.ref();
        final toSavePassword = encryptString(password);
        await db.child('users/${user.uid}/password').set(toSavePassword);
        return SavePasswordResponse(
          success: true,
          password: toSavePassword,
          plainPassword: password,
        );
      } else {
        return const SavePasswordResponse(
          success: false,
        );
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error: $e, $stacktrace ');
      }
      return const SavePasswordResponse(
        success: false,
      );
    }
  }

  ///
  Future<GetPasswordResponse> getPassword() async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final db = FirebaseDatabase.instance.ref();
        final snapshot = db.child('users/${user.uid}/password').get();
        final password = await snapshot.then((value) => value.value as String?);
        if (password != null) {
          return GetPasswordResponse(success: true, password: password);
        } else {
          return const GetPasswordResponse(success: false);
        }
      } else {
        return const GetPasswordResponse(
          success: false,
        );
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error: $e, $stacktrace');
      }
      return const GetPasswordResponse(
        success: false,
      );
    }
  }
}
