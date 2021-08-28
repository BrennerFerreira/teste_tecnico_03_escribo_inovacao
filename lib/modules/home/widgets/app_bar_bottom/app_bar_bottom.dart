import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/constants/constants.dart';

import '../../../../app/theme/app_text_styles.dart';

/// [AppBarBottom] is a widget to show the tabs in the [HomePage] app bar.
class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
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
  Size get preferredSize => const Size.fromHeight(
        AppConstants.fullAppBarHeight,
      );
}
