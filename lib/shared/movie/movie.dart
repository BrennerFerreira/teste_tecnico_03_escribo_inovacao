import 'dart:convert';

import '../constants/constants.dart';

/// [Movie] is a class to model the movie data retrieved from the API.
class Movie {
  /// The [title] of the movie.
  final String title;

  /// [episodeId] is an integer that references the series episode which this
  /// movie represents.
  final int episodeId;

  /// The [director] of the movie.
  final String director;

  /// The [releaseDate] of the movie.
  final DateTime releaseDate;

  /// [Movie] is the default constructor for a movie.
  Movie({
    required this.title,
    required this.episodeId,
    required this.director,
    required this.releaseDate,
  });

  Movie copyWith({
    String? title,
    int? episodeId,
    String? director,
    DateTime? releaseDate,
  }) {
    return Movie(
      title: title ?? this.title,
      episodeId: episodeId ?? this.episodeId,
      director: director ?? this.director,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  /// [Movie] constructor from a map with the correct keys.
  /// Returns a new [Movie] instance each time.
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map[AppConstants.titleAttribute] as String,
      episodeId: map[AppConstants.episodeIdJson] as int,
      director: map[AppConstants.directorAttribute] as String,
      releaseDate: DateTime.parse(
        map[AppConstants.releaseDateJson] as String,
      ),
    );
  }

  /// [Movie] constructor from a JSON containing the correct keys.
  /// Returns a new [Movie] instance each time.
  factory Movie.fromJson(String source) => Movie.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'Movie(title: $title, episodeId: $episodeId, director: $director, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.episodeId == episodeId &&
        other.director == director &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        episodeId.hashCode ^
        director.hashCode ^
        releaseDate.hashCode;
  }
}
