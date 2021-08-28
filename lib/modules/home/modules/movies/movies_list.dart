import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../../shared/star_wars_item/models/movie.dart';
import '../shared/widgets/base_list/base_list.dart';
import 'controllers/movies_bloc.dart';

/// [MoviesList] is used as the [HomePage] scaffold body when the "Filmes" tab
/// is selected.
class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MoviesBloc>(
      create: (context) => getIt<MoviesBloc>()..add(FetchDataMoviesEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              return BaseList(
                isLoading: state.isLoading,
                list: state.movies,
                invertFavoriteFunction: (movie) {
                  context.read<MoviesBloc>().add(
                        InvertFavoriteMoviesEvent(movie as Movie),
                      );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
