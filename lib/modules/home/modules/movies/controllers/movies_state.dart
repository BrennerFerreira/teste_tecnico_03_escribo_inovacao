part of 'movies_bloc.dart';

/// Base state for [MoviesBloc].
@immutable
abstract class MoviesState {
  /// [isLoading] is the attribute used to control whether the movie data fetch
  /// is in progress.
  final bool isLoading;

  /// [movies] is the list of [Movie] fetched from the API.
  final List<Movie> movies;

  /// [MoviesState] is the default constructor for this class.
  const MoviesState({required this.isLoading, required this.movies});

  @override
  String toString() => 'MoviesState(isLoading: $isLoading, movies: $movies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoviesState &&
        other.isLoading == isLoading &&
        listEquals(other.movies, movies);
  }

  @override
  int get hashCode => isLoading.hashCode ^ movies.hashCode;
}

/// [InitialMoviesState] is the initial state for the [MoviesBloc].
class InitialMoviesState extends MoviesState {
  /// [InitialMoviesState] is the default constructor for this class.
  const InitialMoviesState() : super(isLoading: true, movies: const []);
}

/// [FetchDoneMoviesState] is the state for the [MoviesBloc] yielded when the data
/// has been fetched from the API, independent if it was successfully or not.
class FetchDoneMoviesState extends MoviesState {
  /// [FetchDoneMoviesState] is the default constructor for this class.
  const FetchDoneMoviesState({
    required List<Movie> movies,
  }) : super(
          isLoading: true,
          movies: movies,
        );
}
