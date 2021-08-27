import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_text_styles.dart';

import 'widgets/website_button/website_button.dart';

/// [HomePage] is the app main page, which lists all movies, characters and
/// user favorites.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 168,
          title: Row(
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
          ),
          bottom: const TabBar(
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
          ),
        ),
      ),
    );
  }
}
