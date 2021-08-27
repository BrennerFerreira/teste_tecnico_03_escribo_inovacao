import 'package:flutter/material.dart';

import 'widgets/website_button/website_button.dart';

/// [AppBarTitle] is the widget responsible to show the website button and
/// the user avatar in the app [AppBar].
class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WebsiteButton(),
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
