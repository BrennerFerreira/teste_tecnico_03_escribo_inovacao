part of 'movies_bloc.dart';

/// [MoviesEvent] is the base class for all events related to [MoviesBloc].
@immutable
abstract class MoviesEvent {}

/// [FetchData] event is generated when it is necessary to retrieve data from
/// the API.
class FetchDataMoviesEvent extends MoviesEvent {}
