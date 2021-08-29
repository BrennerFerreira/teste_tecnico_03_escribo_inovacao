import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../services/i_avatar_services.dart';

part 'avatar_event.dart';
part 'avatar_state.dart';

/// [AvatarBloc] handles all the events related to the user avatar and emits
/// a state with the latest config.
@injectable
class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  /// Default constructor for this class.
  AvatarBloc(this._services) : super(const AvatarState(isLoading: true));

  final IAvatarServices _services;

  @override
  Stream<AvatarState> mapEventToState(
    AvatarEvent event,
  ) async* {
    if (event is GetSavedAvatarEvent) {
      yield state.copyWith(isLoading: true);

      final avatarConfig = await _services.getAvatar();

      yield state.copyWith(
        isLoading: false,
        config: avatarConfig,
      );
    }

    if (event is SaveAvatarEvent) {
      if (event.newConfig != state.config) {
        yield state.copyWith(isLoading: true);

        final saveResult = await _services.saveAvatar(event.newConfig);

        if (saveResult) {
          yield state.copyWith(config: event.newConfig);
        }

        yield state.copyWith(isLoading: false);
      }
    }
  }
}
