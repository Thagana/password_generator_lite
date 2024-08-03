import 'dart:async';

import 'package:auth_repository/src/data/auth_api_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
class AuthRepository {
  final _provider = AuthApiRepository();

  ///
  Future<UserCredential?> signInWithGoogle() {
    return _provider.signInWithGoogle();
  }

  ///
  StreamController<bool> isUserLoggedOut() {
    return _provider.isUserLoggedOut();
  }

  ///
  bool signOut(String password) {
    return _provider.signOut();
  }

  ///
  User? getUser() {
    return _provider.getCurrentUser();
  }

}
