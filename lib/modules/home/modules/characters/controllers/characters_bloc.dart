import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/favorites/controllers/favorites_bloc.dart';
import '../../../../../shared/star_wars_item/models/character.dart';
import '../services/i_characters_services.dart';

part 'characters_event.dart';
part 'characters_state.dart';

/// [CharactersBloc] controls the [CharactersList] UI, being the connection
/// between the UI and the external services.
@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  /// [CharactersBloc] is the default constructor for this class.
  CharactersBloc(
    this._services,
    this._favoritesBloc,
  ) : super(const InitialCharactersState()) {
    _favoritesBloc.add(GetAllFavoritesEvent());
  }

  final ICharactersServices _services;
  final FavoritesBloc _favoritesBloc;

  List<Character> _checkFavoriteStatus(List<Character> characters) {
    final charactersWithFavorites = characters.map((character) {
      final favoritesContainsCharacter =
          _favoritesBloc.favoritesContainsItem(character);

      if (favoritesContainsCharacter) {
        return character.invertFavorite() as Character;
      }

      return character;
    }).toList();

    return charactersWithFavorites;
  }

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    if (event is FetchDataCharactersEvent) {
      yield const InitialCharactersState();

      final characters = await _services.getAllCharacters();

      yield FetchDoneCharactersState(
        characters: _checkFavoriteStatus(characters),
      );
    }

    if (event is NewPageRequestCharactersEvent) {
      final newCharacters = await _services.getNewPageOfCharacters(
        state._nextPage,
      );

      final newListOfCharacters = [
        ...state.characters,
        ..._checkFavoriteStatus(newCharacters),
      ];

      yield state.copyWith(
        characters: newListOfCharacters,
        currentApiPage: state._nextPage,
      );
    }

    if (event is InvertFavoriteCharactersEvent) {
      final updatedCharactersList = [...state.characters].map((character) {
        if (character == event.character) {
          return character.invertFavorite() as Character;
        }

        return character;
      }).toList();

      yield FetchDoneCharactersState(characters: updatedCharactersList);
    }
  }
}
