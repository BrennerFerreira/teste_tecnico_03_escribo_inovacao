import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../../../../avatar/controllers/avatar_bloc.dart';
import 'widgets/avatar_container/avatar_container.dart';

/// [AvatarButton] is the widget that is placed in the app AppBar that
/// redirects to the avatar choice page.
class AvatarButton extends StatelessWidget {
  /// The color used in the background of this widget.
  final Color backgroundColor;

  /// The function called when this button is pressed.
  final VoidCallback onPressed;

  /// Default constructor for this class.
  const AvatarButton({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: BlocBuilder<AvatarBloc, AvatarState>(
        builder: (context, state) {
          if (state.isLoading || state.config == null) {
            return AvatarContainer(backgroundColor: backgroundColor);
          } else {
            final avatarSvgData = FluttermojiFunctions()
                .decodeFluttermojifromString(state.config!);

            return AvatarContainer(
              backgroundColor: backgroundColor,
              child: SvgPicture.string(
                avatarSvgData,
                height: 30,
                width: 30,
              ),
            );
          }
        },
      ),
    );
  }
}
