import 'package:flutter/material.dart';

import '../../../../../../shared/movie/model/movie.dart';

/// [MovieTile] creates a list tile with the movie information provided.
class MovieTile extends StatelessWidget {
  ///[movie] is the [Movie] that will be displayed in the tile.
  final Movie movie;

  /// Default constructor for the [MovieTile] widget.
  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
    );
  }
}
