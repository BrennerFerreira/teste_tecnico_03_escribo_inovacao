import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/movie/movie.dart';
import '../services/i_movies_services.dart';

part 'movies_event.dart';
part 'movies_state.dart';

/// [MoviesBloc] controls the [MoviesList] UI, being the connection between
/// the UI and the external services.
@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  /// [MoviesBloc] is the default constructor for this class.
  MoviesBloc(this._services) : super(const InitialMoviesState());

  final IMoviesServices _services;

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchDataMoviesEvent) {
      yield const InitialMoviesState();

      final movies = await _services.getAllMovies();

      yield FetchDoneMoviesState(movies: movies);
    }
  }
}
