part of 'characters_bloc.dart';

/// [CharactersEvent] is the base class for all events related to [CharactersBloc].
@immutable
abstract class CharactersEvent {}

/// [FetchDataCharactersEvent] is generated when it is necessary to retrieve
/// data from the API.
class FetchDataCharactersEvent extends CharactersEvent {}

/// [NewPageRequestCharactersEvent] is generated when it is necessary to
/// retrieve a new page of characters data from the API.
class NewPageRequestCharactersEvent extends CharactersEvent {}

/// [InvertFavoriteCharactersEvent] event is generated when it is necessary to
/// save or remove favorites status of the character.
class InvertFavoriteCharactersEvent extends CharactersEvent {
  /// The character to invert the favorite status.
  final Character character;

  /// Default constructor for this class.
  InvertFavoriteCharactersEvent(this.character);

  @override
  String toString() => 'InvertFavoriteCharactersEvent(character: $character)';
}
