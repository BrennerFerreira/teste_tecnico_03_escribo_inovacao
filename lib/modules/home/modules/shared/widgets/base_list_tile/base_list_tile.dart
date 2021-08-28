import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/theme/app_colors.dart';
import '../../../../../../app/theme/app_text_styles.dart';
import '../../../../../../shared/favorites/controllers/favorites_bloc.dart';
import '../../../../../../shared/star_wars_item/models/star_wars_item.dart';
import '../tile_container/tile_container.dart';

/// [BaseListTile] creates a list tile with the movie information provided.
class BaseListTile extends StatelessWidget {
  ///The item that will be displayed in the tile.
  final StarWarsItem item;

  /// The function that will be called when the favorite button is tapped.
  final void Function(StarWarsItem)? invertFavoriteFunction;

  /// Default constructor for the [BaseListTile] widget.
  const BaseListTile({
    Key? key,
    required this.item,
    this.invertFavoriteFunction,
  }) : super(key: key);

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

            if (invertFavoriteFunction != null) {
              invertFavoriteFunction!(item);
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
