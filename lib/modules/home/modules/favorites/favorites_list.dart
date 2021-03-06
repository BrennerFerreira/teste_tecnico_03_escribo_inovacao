import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/favorites/controllers/favorites_bloc.dart';
import '../../../../shared/star_wars_item/models/movie.dart';
import '../../../../shared/widgets/error_widget/error_widget.dart';
import '../../../../shared/widgets/loading_widget/loading_widget.dart';
import '../shared/widgets/tile_container/tile_container.dart';
import 'widgets/empty_list_widget/empty_list_widget.dart';

/// [FavoritesList] is used as the [HomePage] scaffold body when the
/// "Favoritos" tab is selected.
class FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return LoadingWidget();
          }

          if (state.dbError) {
            return ErrorTextWidget();
          }

          if (state.favorites.isEmpty) {
            return EmptyListWidget();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return TileContainer(
                    backgroundColor: state.favorites[index] is Movie
                        ? AppColors.redColor
                        : AppColors.greenColor,
                    child: ListTile(
                      title: Text(
                        state.favorites[index].title,
                        style: AppTextStyles.textRegular,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
