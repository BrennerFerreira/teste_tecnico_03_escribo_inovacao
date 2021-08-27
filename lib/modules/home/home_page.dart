import 'package:flutter/material.dart';

import 'modules/movies/movies_list.dart';
import 'widgets/app_bar_bottom/app_bar_bottom.dart';
import 'widgets/app_bar_title/app_bar_title.dart';

/// [HomePage] is the app main page, which lists all movies, characters and
/// user favorites.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const totalTabs = 3;
    const appBarHeight = 144.0;

    return DefaultTabController(
      length: totalTabs,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: appBarHeight,
          title: AppBarTitle(),
          bottom: const AppBarBottom(appBarHeight: appBarHeight),
        ),
        body: TabBarView(
          children: [
            MoviesList(),
            Container(color: Colors.blue),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}