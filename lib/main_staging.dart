import 'package:cyberman/app/app.dart';
import 'package:cyberman/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'cyberman.stg.db'),
  );
  await bootstrap(App.new);
}