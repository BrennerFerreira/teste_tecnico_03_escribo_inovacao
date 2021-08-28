import 'package:flutter/material.dart';

import '../../app/router/route_names.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/constants/constants.dart';
import '../../shared/widgets/app_bar_title/app_bar_title.dart';
import 'modules/characters/characters_list.dart';
import 'modules/favorites/favorites_list.dart';
import 'modules/movies/movies_list.dart';
import 'widgets/app_bar_bottom/app_bar_bottom.dart';

/// [HomePage] is the app main page, which lists all movies, characters and
/// user favorites.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const totalTabs = 3;

    return DefaultTabController(
      length: totalTabs,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: AppConstants.fullAppBarHeight,
          title: AppBarTitle(
            websiteButtonBackgroundColor:
                AppColors.accentColor.withOpacity(0.5),
            avatarButtonBackgroundColor: AppColors.accentColor.withOpacity(0.5),
            onWebsiteButtonPressed: () {
              Navigator.of(context).pushNamed(RouteNames.websiteRoute);
            },
            onAvatarButtonPressed: () {
              Navigator.of(context).pushNamed(RouteNames.avatarRoute);
            },
          ),
          bottom: AppBarBottom(),
        ),
        body: TabBarView(
          children: [
            MoviesList(),
            CharactersList(),
            FavoritesList(),
          ],
        ),
      ),
    );
  }
}
