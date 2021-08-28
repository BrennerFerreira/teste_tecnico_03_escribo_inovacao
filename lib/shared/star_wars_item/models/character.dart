import '../../constants/constants.dart';
import 'star_wars_item.dart';

/// [Character] is a class to model the Character data retrieved from the API.
class Character extends StarWarsItem {
  /// [Character] is the default constructor for a Character.
  Character({
    required String title,
    bool? isFavorite,
  }) : super(
          title: title,
          type: ItemType.character,
          isFavorite: isFavorite ?? false,
        );

  /// [Character] constructor from a map with the correct keys.
  /// Returns a new [Character] instance each time.
  factory Character.fromMap(Map<String, dynamic> map) {
    late bool isFavorite;

    if (map[AppConstants.isFavoriteAttribute] == null ||
        map[AppConstants.isFavoriteAttribute] == 'false') {
      isFavorite = false;
    } else {
      isFavorite = true;
    }

    return Character(
      title: (map[AppConstants.nameAttribute] ??
          map[AppConstants.titleAttribute]) as String,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() {
    return 'Character(title: $title, type: $type, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.title == title &&
        other.type == type &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return title.hashCode ^ type.hashCode ^ isFavorite.hashCode;
  }

  @override
  StarWarsItem invertFavorite() {
    return Character(title: title, isFavorite: !isFavorite);
  }
}
