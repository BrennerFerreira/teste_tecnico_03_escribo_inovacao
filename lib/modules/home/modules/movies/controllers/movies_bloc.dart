import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/favorites/controllers/favorites_bloc.dart';
import '../../../../../shared/movie/model/movie.dart';
import '../services/i_movies_services.dart';

part 'movies_event.dart';
part 'movies_state.dart';

/// [MoviesBloc] controls the [MoviesList] UI, being the connection between
/// the UI and the external services.
@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  /// [MoviesBloc] is the default constructor for this class.
  MoviesBloc(
    this._services,
    this._favoritesBloc,
  ) : super(const InitialMoviesState()) {
    _favoritesBloc.add(GetAllFavoritesEvent());
  }

  final IMoviesServices _services;
  final FavoritesBloc _favoritesBloc;

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchDataMoviesEvent) {
      yield const InitialMoviesState();

      final movies = await _services.getAllMovies();

      final moviesWithFavorites = movies.map((movie) {
        final favoritesContainsMovie =
            _favoritesBloc.favoritesContainsItem(movie);

        if (favoritesContainsMovie) {
          return movie.invertFavorite() as Movie;
        }

        return movie;
      }).toList();

      yield FetchDoneMoviesState(movies: moviesWithFavorites);
    }

    if (event is InvertFavoriteMoviesEvent) {
      final updatedMoviesList = [...state.movies].map((movie) {
        if (movie == event.movie) {
          return movie.invertFavorite() as Movie;
        }

        return movie;
      }).toList();

      yield FetchDoneMoviesState(movies: updatedMoviesList);
    }
  }
}
