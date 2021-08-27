import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';

/// [AppBarBottom] is a widget to show the tabs in the [HomePage] app bar.
class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  /// [appBarHeight] is the height of the [AppBar] in which this widget is
  /// being used.
  final double appBarHeight;

  /// [AppBarBottom] is the default constructor of this widget.
  const AppBarBottom({Key? key, required this.appBarHeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          child: Text(
            "Filmes",
            style: AppTextStyles.appBarTextRegular,
            textAlign: TextAlign.center,
          ),
        ),
        Tab(
          child: Text(
            "Personagens",
            style: AppTextStyles.appBarTextRegular,
            textAlign: TextAlign.center,
          ),
        ),
        Tab(
          child: Text(
            "Favoritos",
            style: AppTextStyles.appBarTextRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
