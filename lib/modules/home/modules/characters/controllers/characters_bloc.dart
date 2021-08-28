import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/character/model/character.dart';
import '../services/i_characters_services.dart';

part 'characters_event.dart';
part 'characters_state.dart';

/// [CharactersBloc] controls the [CharactersList] UI, being the connection
/// between the UI and the external services.
@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  /// [CharactersBloc] is the default constructor for this class.
  CharactersBloc(this._services) : super(const InitialCharactersState());

  final ICharactersServices _services;

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    if (event is FetchDataCharactersEvent) {
      yield const InitialCharactersState();

      final characters = await _services.getAllCharacters();

      yield FetchDoneCharactersState(characters: characters);
    }

    if (event is NewPageRequestCharactersEvent) {
      final newCharacters = await _services.getNewPageOfCharacters(
        state._nextPage,
      );

      final newListOfCharacters = [...state.characters, ...newCharacters];

      yield state.copyWith(
        characters: newListOfCharacters,
        currentApiPage: state._nextPage,
      );
    }
  }
}
