import 'package:sqflite/sqflite.dart';

import '../../../constants/constants.dart';

/// [AppDatabase] is responsible for create or retrieve the SQLITE database
/// instance for this app.
///
/// It works as a singleton, returning the same instance every time it is called.
class AppDatabase {
  /// Default constructor for this class.
  ///
  /// Returns a singleton instance of this class.
  factory AppDatabase() => _instance;

  AppDatabase._();

  static final AppDatabase _instance = AppDatabase._();

  Database? _db;

  /// Returns the database instance.
  Future<Database> get db async => _db ?? await _initDb();

  Future<Database> _initDb() async {
    const databasePath = "./star_wars_app.db";

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
          '''
          CREATE TABLE ${AppConstants.favoritesTable} (
            ${AppConstants.idString} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${AppConstants.titleAttribute} TEXT,
            ${AppConstants.typeAttribute} TEXT
          )
          ''',
        );
      },
    );
  }
}
