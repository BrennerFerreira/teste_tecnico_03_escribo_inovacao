import '../../../../../shared/star_wars_item/models/character.dart';

/// [ICharactersServices] is an interface to all external requests for the
/// characters list tab.
abstract class ICharactersServices {
  /// [getAllCharacters] should send a request to the API, returning a list
  /// of all characters.
  /// Returns a list of [Character] if request is successful and an empty list
  /// otherwise.
  Future<List<Character>> getAllCharacters();

  /// [getNewPageOfCharacters] should send a request to the API, returning a list
  /// of characters from a new page.
  /// Returns a list of [Character] if request is successful and an empty list
  /// otherwise.
  Future<List<Character>> getNewPageOfCharacters(int page);
}
