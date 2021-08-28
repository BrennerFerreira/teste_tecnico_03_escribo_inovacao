import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../star_wars_item/model/star_wars_item.dart';
import '../services/favorites_services.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

/// [FavoritesBloc] handles all events related to favoriting an [StarWarsItem]
/// and emits new states corresponding to the event received.
@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  /// Default constructor for this class.
  FavoritesBloc(this._services) : super(InitialFavoritesState());

  final FavoritesServices _services;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is GetAllFavoritesEvent) {
      yield state.copyWith(isLoading: true);

      final favorites = await _services.getAllFavorites();

      if (favorites == null) {
        yield state.copyWith(dbError: true);
      } else {
        yield state.copyWith(favorites: favorites);
      }

      yield state.copyWith(isLoading: false);
    }

    if (event is SaveFavoritesEvent) {
      final saveResult = await _services.saveFavorite(event.item);

      if (saveResult) {
        yield state.copyWith(
          favorites: [...state.favorites, event.item],
        );
      }
    }

    if (event is RemoveFavoritesEvent) {
      final removeResult = await _services.removeFavorite(event.item);

      if (removeResult) {
        final itemIndex = state.favorites.indexWhere(
          (item) => item.title == event.item.title,
        );

        final newFavoritesList = [...state.favorites]..removeAt(itemIndex);

        yield state.copyWith(
          favorites: newFavoritesList,
        );
      }
    }
  }
}
