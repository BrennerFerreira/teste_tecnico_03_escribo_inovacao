import '../../constants/constants.dart';

/// [ItemType] defines if the items is a movie or a character.
enum ItemType {
  /// Defines an item of type movie.
  movie,

  /// Defines an item of type character.
  character,
}

/// [StarWarsItem] is the base class for an item or a character.
abstract class StarWarsItem {
  /// The title of the item.
  final String title;

  ///The type of the item.
  final ItemType type;

  ///Whether this item is marked as favorite by the user.
  final bool isFavorite;

  /// Default constructor for this class.
  StarWarsItem({
    required this.title,
    required this.type,
    required this.isFavorite,
  });

  /// [invertFavorite] inverts the favorite status of the item.
  StarWarsItem invertFavorite();

  /// [toMap] converts the item to a map to be saved in the database.
  Map<String, dynamic> toMap() {
    return {
      AppConstants.titleAttribute: title,
      AppConstants.typeAttribute: type.toString(),
    };
  }
}
