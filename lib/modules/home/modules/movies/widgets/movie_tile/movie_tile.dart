import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_colors.dart';

import '../../../../../../app/theme/app_text_styles.dart';
import '../../../../../../shared/movie/model/movie.dart';
import 'widgets/tile_container/tile_container.dart';

/// [MovieTile] creates a list tile with the movie information provided.
class MovieTile extends StatelessWidget {
  ///[movie] is the [Movie] that will be displayed in the tile.
  final Movie movie;

  /// Default constructor for the [MovieTile] widget.
  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TileContainer(
      child: ListTile(
        title: Text(
          movie.title,
          style: AppTextStyles.textRegular,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
