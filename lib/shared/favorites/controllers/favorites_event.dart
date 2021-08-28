part of 'favorites_bloc.dart';

/// [FavoritesEvent] is the base event for [FavoritesBloc].
@immutable
abstract class FavoritesEvent {}

/// [GetAllFavoritesEvent] is called when is necessary to retrieve all favorites
/// saved in the database.
class GetAllFavoritesEvent extends FavoritesEvent {}

/// [SaveFavoritesEvent] is called when is necessary to save a new item in
/// the database.
class SaveFavoritesEvent extends FavoritesEvent {
  /// The item to be saved.
  final StarWarsItem item;

  /// Default constructor for this class.
  SaveFavoritesEvent({required this.item});

  @override
  String toString() => 'SaveFavoritesEvent(item: $item)';
}

/// [RemoveFavoritesEvent] is called when is necessary to remove an item from
/// the database.
class RemoveFavoritesEvent extends FavoritesEvent {
  /// The item to be removed.
  final StarWarsItem item;

  /// Default constructor for this class.
  RemoveFavoritesEvent({required this.item});

  @override
  String toString() => 'RemoveFavoritesEvent(item: $item)';
}
