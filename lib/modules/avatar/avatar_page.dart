import 'package:flutter/material.dart';

import '../../app/router/route_names.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/constants/constants.dart';
import '../../shared/widgets/app_bar_title/app_bar_title.dart';

/// [AvatarPage] is the page where the user can view and change their avatar.
class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: AppConstants.smallAppBarHeight,
        backgroundColor: AppColors.backgroundColor,
        title: AppBarTitle(
          websiteButtonBackgroundColor: AppColors.accentColor.withOpacity(0.5),
          avatarButtonBackgroundColor: AppColors.backgroundColor,
          onWebsiteButtonPressed: () {
            Navigator.of(context).pushReplacementNamed(RouteNames.websiteRoute);
          },
          onAvatarButtonPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.settings.name == RouteNames.homeRoute,
            );
          },
        ),
      ),
      body: const Center(
        child: Text("Avatar"),
      ),
    );
  }
}
