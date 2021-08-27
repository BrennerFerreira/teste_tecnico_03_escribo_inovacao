import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import 'controllers/movies_bloc.dart';

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
              return Text("${state.movies.length}");
            },
          );
        },
      ),
    );
  }
}
