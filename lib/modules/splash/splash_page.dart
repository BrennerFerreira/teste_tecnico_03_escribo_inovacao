import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/widgets/error_widget/error_widget.dart';

import '../../app/router/route_names.dart';
import '../../shared/favorites/controllers/favorites_bloc.dart';
import '../../shared/widgets/loading_widget/loading_widget.dart';

/// The splash page of the app. It awaits for the [FavoritesBloc] to retrieve
/// the data from the database and redirects to [HomePage] when succeeds.
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        if (!state.isLoading && !state.dbError) {
          Navigator.of(context).pushReplacementNamed(RouteNames.homeRoute);
        }
      },
      builder: (context, state) {
        return Material(
          child: state.dbError ? ErrorTextWidget() : LoadingWidget(),
        );
      },
    );
  }
}
