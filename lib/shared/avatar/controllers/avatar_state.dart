part of 'avatar_bloc.dart';

/// [AvatarState] is the base state for the [AvatarBloc].
@immutable
class AvatarState {
  /// The current configuration of the user avatar.
  final String? config;

  /// Whether the [AvatarBloc] is making a request to the database.
  final bool isLoading;

  /// Default constructor of this class.
  const AvatarState({required this.isLoading, this.config});

  /// Returns a new instance of [AvatarState] with the given attributes
  /// updated.
  AvatarState copyWith({
    String? config,
    bool? isLoading,
  }) {
    return AvatarState(
      config: config ?? this.config,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'AvatarState(config: $config, isLoading: $isLoading)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvatarState &&
        other.config == config &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => config.hashCode ^ isLoading.hashCode;
}
