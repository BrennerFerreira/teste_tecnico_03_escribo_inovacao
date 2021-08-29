part of 'avatar_bloc.dart';

/// [AvatarEvent] is the base event for [AvatarBloc].
@immutable
abstract class AvatarEvent {}

/// [GetSavedAvatarEvent] is called when it is necessary to retrieve the
/// currently saved avatar from the database.
class GetSavedAvatarEvent extends AvatarEvent {}

/// [SaveAvatarEvent] is called when it is necessary to save a new avatar
/// configuration in the database. It receives one argument:
///
/// [newConfig]: a string containing the new configuration to be saved.
class SaveAvatarEvent extends AvatarEvent {
  /// [newConfig] is a string containing the new configuration to be saved.
  final String newConfig;

  /// Default constructor for this class.
  SaveAvatarEvent(this.newConfig);

  @override
  String toString() => 'SaveAvatarEvent(newConfig: $newConfig)';
}
