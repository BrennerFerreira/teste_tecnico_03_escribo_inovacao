import 'package:flutter/material.dart';

import 'widgets/website_button/website_button.dart';

/// [AppBarTitle] is the widget responsible to show the website button and
/// the user avatar in the app [AppBar].
class AppBarTitle extends StatelessWidget {
  /// The function that will be called when the website button is pressed.
  final VoidCallback onWebsiteButtonPressed;

  /// Default constructor for this class;
  const AppBarTitle({
    Key? key,
    required this.onWebsiteButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WebsiteButton(
          onPressed: onWebsiteButtonPressed,
        ),
        CircleAvatar(
          child: Container(
            height: 64,
            width: 64,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
