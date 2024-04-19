import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///
const todoTABLE = 'passwords';

///
class DatabaseProvider {

  Database? _database;

  ///
  static final DatabaseProvider dbProvider = DatabaseProvider();

  ///
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await createDatabase();
    return _database!;
  }

  ///
  Future<Database> createDatabase() async {
    final database = await openDatabase(
        join(await getDatabasesPath(), 'cyberman.db'),
        version: 1,
        onCreate: initDB,
        onUpgrade: onUpgrade);
    return database;
  }

  ///
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  ///
  Future<void> initDB(Database database, int version) async {
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS passwords (id INTEGER PRIMARY KEY, password TEXT, date DATE);
        CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, name TEXT, date DATE)
    ''',
    );
  }
}
