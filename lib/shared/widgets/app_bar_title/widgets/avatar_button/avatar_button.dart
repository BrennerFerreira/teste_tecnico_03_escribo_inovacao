import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

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
      child: FluttermojiCircleAvatar(
        radius: 32,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
