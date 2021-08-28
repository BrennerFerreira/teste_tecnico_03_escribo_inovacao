part of 'favorites_bloc.dart';

/// [FavoritesState] is the base state for [FavoritesBloc].
@immutable
class FavoritesState {
  /// Whether [FavoritesBloc] is processing a request to the database or not.
  final bool isLoading;

  /// Whether there was an error while retrieving data from the database or not.
  final bool dbError;

  /// The list of favorites save in the database.
  final List<StarWarsItem> favorites;

  /// Default constructor for this class.
  const FavoritesState({
    required this.isLoading,
    required this.dbError,
    required this.favorites,
  });

  @override
  String toString() =>
      'FavoritesState(isLoading: $isLoading, dbError: $dbError, favorites: $favorites)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoritesState &&
        other.isLoading == isLoading &&
        other.dbError == dbError &&
        listEquals(other.favorites, favorites);
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^ dbError.hashCode ^ favorites.hashCode;

  /// Generates a new [FavoritesState] with the indicated fields updated.
  FavoritesState copyWith({
    bool? isLoading,
    bool? dbError,
    List<StarWarsItem>? favorites,
  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      dbError: dbError ?? this.dbError,
      favorites: favorites ?? this.favorites,
    );
  }
}

/// [InitialFavoritesState] is the initial state for [FavoritesBloc].
class InitialFavoritesState extends FavoritesState {
  /// Default constructor for this class.
  InitialFavoritesState()
      : super(
          isLoading: true,
          dbError: false,
          favorites: [],
        );
}
