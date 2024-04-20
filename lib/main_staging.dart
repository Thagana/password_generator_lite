import 'package:cyberman/app/app.dart';
import 'package:cyberman/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await bootstrap(App.new);
}