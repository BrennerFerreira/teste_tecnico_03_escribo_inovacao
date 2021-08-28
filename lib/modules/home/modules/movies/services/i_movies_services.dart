import '../../../../../shared/star_wars_item/models/movie.dart';

/// [IMoviesServices] is an interface to all external requests for the movies
/// list tab.
abstract class IMoviesServices {
  /// [getAllMovies] should send a request to the API, returning a list of all
  /// movies.
  /// Returns a list of [Movie] if request is successful and an empty list
  /// otherwise.
  Future<List<Movie>> getAllMovies();
}
