import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_colors.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_text_styles.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/favorites/widgets/empty_list_widget/empty_list_widget.dart';
import 'package:teste_tecnico_03_escribo_inovacao/modules/home/modules/shared/widgets/tile_container/tile_container.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/movie/model/movie.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/widgets/error_widget/error_widget.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/widgets/loading_widget/loading_widget.dart';

import '../../../../shared/favorites/controllers/favorites_bloc.dart';

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
