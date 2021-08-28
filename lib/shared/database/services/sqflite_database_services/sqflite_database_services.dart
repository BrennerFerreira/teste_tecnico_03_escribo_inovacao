import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constants/constants.dart';
import '../i_database_services.dart';
import 'app_database.dart';

/// [SqfliteDatabaseServices] is the concrete implementation of
/// [IDatabaseServices] using the [Sqflite] package.
@Injectable(as: IDatabaseServices)
class SqfliteDatabaseServices implements IDatabaseServices {
  Future<Database> _database() async => AppDatabase().db;

  @override
  Future<bool> removeData({
    required String tableName,
    required String title,
  }) async {
    try {
      final database = await _database();

      await database.delete(
        tableName,
        where: '${AppConstants.titleAttribute} = ?',
        whereArgs: [title],
      );

      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> saveData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    try {
      final database = await _database();

      await database.insert(tableName, data);

      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllData({
    required String tableName,
  }) async {
    try {
      final database = await _database();

      final results = await database.query(tableName);

      return results;
    } on Exception {
      return null;
    }
  }
}
