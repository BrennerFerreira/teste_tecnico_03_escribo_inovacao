import 'package:injectable/injectable.dart';

import '../i_avatar_services.dart';

/// [SqfliteAvatarServices] is the concrete implementation of [IAvatarServices]
/// using the Sqflite package.
@Injectable(as: IAvatarServices)
class SqfliteAvatarServices implements IAvatarServices {
  @override
  Future<bool> saveAvatar(String avatarConfig) async {
    print(avatarConfig);
    return true;
  }

  @override
  Future<String?> getAvatar() async {
    print('inside get Avatar');
    return '';
  }
}
