part of 'characters_bloc.dart';

/// Base state for [CharactersBloc].
@immutable
abstract class CharactersState {
  /// [isLoading] is the attribute used to control whether the movie data fetch
  /// is in progress.
  final bool isLoading;

  /// [characters] is the list of [Character] fetched from the API.
  final List<Character> characters;

  /// [CharactersState] is the default constructor for this class.
  const CharactersState({required this.isLoading, required this.characters});

  @override
  String toString() =>
      'CharactersState(isLoading: $isLoading, characters: $characters)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersState &&
        other.isLoading == isLoading &&
        listEquals(other.characters, characters);
  }

  @override
  int get hashCode => isLoading.hashCode ^ characters.hashCode;
}

/// [InitialCharactersState] is the initial state for the [CharactersBloc].
class InitialCharactersState extends CharactersState {
  /// [InitialCharactersState] is the default constructor for this class.
  const InitialCharactersState() : super(isLoading: true, characters: const []);
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
        );
}
