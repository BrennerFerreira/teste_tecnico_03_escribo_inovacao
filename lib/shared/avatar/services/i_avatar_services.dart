/// [IAvatarServices] is an interface that abstracts all actions related to
/// the user avatar.
abstract class IAvatarServices {
  /// [saveAvatar] saves the avatar configuration to the database.
  Future<bool> saveAvatar(String avatarConfig);

  /// [getAvatar] retrieves the latest avatar configuration saved in the
  ///  database.
  Future<String?> getAvatar();
}
