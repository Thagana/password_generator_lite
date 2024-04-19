import 'package:cyberman/app/app.dart';
import 'package:cyberman/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openDatabase(
    join(await getDatabasesPath(), 'cyberman.db'),
  );
  await bootstrap(App.new);
}
