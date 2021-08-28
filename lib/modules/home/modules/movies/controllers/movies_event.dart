part of 'movies_bloc.dart';

/// [MoviesEvent] is the base class for all events related to [MoviesBloc].
@immutable
abstract class MoviesEvent {}

/// [FetchDataMoviesEvent] event is generated when it is necessary to retrieve data from
/// the API.
class FetchDataMoviesEvent extends MoviesEvent {}

/// [InvertFavoriteMoviesEvent] event is generated when it is necessary to save or remove
/// favorites status of the movie.
class InvertFavoriteMoviesEvent extends MoviesEvent {
  /// The movie to invert the favorite status.
  final Movie movie;

  /// Default constructor for this class.
  InvertFavoriteMoviesEvent(this.movie);

  @override
  String toString() => 'InvertFavoriteMoviesEvent(movie: $movie)';
}
