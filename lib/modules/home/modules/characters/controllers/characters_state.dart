part of 'characters_bloc.dart';

/// Base state for [CharactersBloc].
@immutable
class CharactersState {
  /// [isLoading] is the attribute used to control whether the movie data fetch
  /// is in progress.
  final bool isLoading;

  /// [characters] is the list of [Character] fetched from the API.
  final List<Character> characters;

  /// [currentApiPage] is the current page of characters retrieved from the API.
  final int currentApiPage;

  /// [CharactersState] is the default constructor for this class.
  const CharactersState({
    required this.isLoading,
    required this.characters,
    required this.currentApiPage,
  });

  int get _nextPage => currentApiPage + 1;

  /// Returns whether [currentApiPage] is the last page to retrieve data from.
  bool get isLastPage => currentApiPage == 9;

  @override
  String toString() =>
      'CharactersState(isLoading: $isLoading, characters: $characters, currentApiPage: $currentApiPage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersState &&
        other.isLoading == isLoading &&
        listEquals(other.characters, characters) &&
        other.currentApiPage == currentApiPage;
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^ characters.hashCode ^ currentApiPage.hashCode;

  /// [copyWith] returns a new instance of [CharactersState] with some attributes
  /// changed.
  CharactersState copyWith({
    bool? isLoading,
    List<Character>? characters,
    int? currentApiPage,
  }) {
    return CharactersState(
      isLoading: isLoading ?? this.isLoading,
      characters: characters ?? this.characters,
      currentApiPage: currentApiPage ?? this.currentApiPage,
    );
  }
}

/// [InitialCharactersState] is the initial state for the [CharactersBloc].
class InitialCharactersState extends CharactersState {
  /// [InitialCharactersState] is the default constructor for this class.
  const InitialCharactersState()
      : super(
          isLoading: true,
          characters: const [],
          currentApiPage: 1,
        );
}

/// [FetchDoneCharactersState] is the state for the [MoviesBloc] yielded when the data
/// has been fetched from the API, independent if it was successfully or not.
class FetchDoneCharactersState extends CharactersState {
  /// [FetchDoneCharactersState] is the default constructor for this class.
  const FetchDoneCharactersState({
    required List<Character> characters,
  }) : super(
          isLoading: false,
          characters: characters,
          currentApiPage: 1,
        );
}
