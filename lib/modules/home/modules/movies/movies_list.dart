import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../../shared/widgets/error_widget/error_widget.dart';
import '../../../../shared/widgets/loading_widget/loading_widget.dart';
import 'controllers/movies_bloc.dart';
import 'widgets/movie_tile/movie_tile.dart';

/// [MoviesList] is used as the [HomePage] scaffold body when the "Filmes" tab
/// is selected.
class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => getIt<MoviesBloc>()..add(FetchDataMoviesEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return LoadingWidget();
              } else if (state.movies.isEmpty) {
                return ErrorTextWidget();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 8.0,
                ),
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return MovieTile(movie: state.movies[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
