/// [IDatabaseServices] is an interface that abstracts the necessary actions
/// required for the database.
abstract class IDatabaseServices {
  /// [saveData] receive two arguments:
  ///
  /// [tableName]: a string with the table name where to save the data.
  ///
  /// [data]: a map containing the data to be saved.
  ///
  /// Returns: [true] if the save is successful and [false] otherwise.
  Future<bool> saveData({
    required String tableName,
    required Map<String, dynamic> data,
  });

  /// [removeData] receive two arguments:
  ///
  /// [tableName]: a string with the table name where to remove the data.
  ///
  /// [title]: a string containing the title to be used to look for the data.
  ///
  /// Returns: [true] if the save is successful and [false] otherwise.
  Future<bool> removeData({
    required String tableName,
    required String title,
  });
}
