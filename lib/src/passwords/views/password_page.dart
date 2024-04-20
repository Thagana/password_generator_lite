import 'package:cyberman/src/passwords/views/passwords_app.dart';
import 'package:cyberman/src/passwords/views/passwords_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class PasswordsPages extends StatelessWidget {
  const PasswordsPages({ super.key });

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const PasswordsWeb() : const PasswordsApp();
  }
}