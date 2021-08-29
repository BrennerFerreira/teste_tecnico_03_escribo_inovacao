import 'package:injectable/injectable.dart';

import '../../../constants/constants.dart';
import '../../../database/services/i_database_services.dart';
import '../i_avatar_services.dart';

/// [SqfliteAvatarServices] is the concrete implementation of [IAvatarServices]
/// using the Sqflite package.
@Injectable(as: IAvatarServices)
class SqfliteAvatarServices implements IAvatarServices {
  final IDatabaseServices _services;

  /// Default constructor for this class.
  SqfliteAvatarServices(this._services);

  @override
  Future<bool> saveAvatar(String avatarConfig) async {
    final removeResult = await _services.removeAllData(
      tableName: AppConstants.avatarTable,
    );

    if (removeResult) {
      final saveResult = await _services.saveData(
        tableName: AppConstants.avatarTable,
        data: {
          AppConstants.configString: avatarConfig,
        },
      );

      return saveResult;
    }

    return false;
  }

  @override
  Future<String?> getAvatar() async {
    final rawResult = await _services.getAllData(
      tableName: AppConstants.avatarTable,
    );
    if (rawResult == null || rawResult.isEmpty) {
      return null;
    }

    final currentlySaveAvatar =
        rawResult.first[AppConstants.configString] as String;

    return currentlySaveAvatar;
  }
}
