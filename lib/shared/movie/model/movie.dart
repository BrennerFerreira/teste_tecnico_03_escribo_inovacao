import '../../constants/constants.dart';
import '../../star_wars_item/model/star_wars_item.dart';

/// [Movie] is a class to model the movie data retrieved from the API.
class Movie extends StarWarsItem {
  /// [Movie] is the default constructor for a movie.
  Movie({
    required String title,
    bool? isFavorite,
  }) : super(
          title: title,
          type: ItemType.movie,
          isFavorite: isFavorite ?? false,
        );

  /// [Movie] constructor from a map with the correct keys.
  /// Returns a new [Movie] instance each time.
  factory Movie.fromMap(Map<String, dynamic> map) {
    late bool isFavorite;

    if (map[AppConstants.isFavoriteAttribute] == null ||
        map[AppConstants.isFavoriteAttribute] == 'false') {
      isFavorite = false;
    } else {
      isFavorite = true;
    }

    return Movie(
      title: map[AppConstants.titleAttribute] as String,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() {
    return 'Movie(title: $title, type: $type, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.type == type &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return title.hashCode ^ type.hashCode ^ isFavorite.hashCode;
  }
}
