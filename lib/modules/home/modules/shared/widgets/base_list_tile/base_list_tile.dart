import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/favorites/controllers/favorites_bloc.dart';

import '../../../../../../app/theme/app_colors.dart';
import '../../../../../../app/theme/app_text_styles.dart';
import '../../../../../../shared/movie/model/movie.dart';
import '../../../../../../shared/star_wars_item/model/star_wars_item.dart';
import '../tile_container/tile_container.dart';

/// [BaseListTile] creates a list tile with the movie information provided.
class BaseListTile extends StatelessWidget {
  ///[movie] is the [Movie] that will be displayed in the tile.
  final StarWarsItem item;

  /// Default constructor for the [BaseListTile] widget.
  const BaseListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TileContainer(
      child: ListTile(
        title: Text(
          item.title,
          style: AppTextStyles.textRegular,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {
            if (item.isFavorite) {
              context.read<FavoritesBloc>().add(
                    RemoveFavoritesEvent(item: item),
                  );
            } else {
              context.read<FavoritesBloc>().add(
                    SaveFavoritesEvent(item: item),
                  );
            }
          },
          icon: Icon(
            item.isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
