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
