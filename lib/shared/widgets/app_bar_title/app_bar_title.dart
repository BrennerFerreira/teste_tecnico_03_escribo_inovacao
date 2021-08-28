import 'package:flutter/material.dart';

import 'widgets/avatar_button/avatar_button.dart';
import 'widgets/website_button/website_button.dart';

/// [AppBarTitle] is the widget responsible to show the website button and
/// the user avatar in the app [AppBar].
class AppBarTitle extends StatelessWidget {
  /// The function that will be called when the website button is pressed.
  final VoidCallback onWebsiteButtonPressed;

  /// The background of the website button.
  final Color websiteButtonBackgroundColor;

  /// The function that will be called when the avatar button is pressed.
  final VoidCallback onAvatarButtonPressed;

  /// The background of the avatar button.
  final Color avatarButtonBackgroundColor;

  /// Default constructor for this class;
  const AppBarTitle({
    Key? key,
    required this.onWebsiteButtonPressed,
    required this.websiteButtonBackgroundColor,
    required this.onAvatarButtonPressed,
    required this.avatarButtonBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WebsiteButton(
          onPressed: onWebsiteButtonPressed,
          backgroundColor: websiteButtonBackgroundColor,
        ),
        AvatarButton(
          backgroundColor: avatarButtonBackgroundColor,
          onPressed: onAvatarButtonPressed,
        )
      ],
    );
  }
}
