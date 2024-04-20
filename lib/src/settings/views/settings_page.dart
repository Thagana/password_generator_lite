import 'package:cyberman/src/settings/views/settings_app.dart';
import 'package:cyberman/src/settings/views/settings_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const SettingsWeb() : const SettingsApp();
  }
}