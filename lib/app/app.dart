import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/avatar/controllers/avatar_bloc.dart';

import '../injection.dart';
import '../shared/favorites/controllers/favorites_bloc.dart';
import 'router/app_routes.dart';
import 'theme/app_theme.dart';

/// MyApp initializes the app setting the theme and routes.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoritesBloc>(
          create: (context) =>
              getIt<FavoritesBloc>()..add(GetAllFavoritesEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<AvatarBloc>()..add(GetSavedAvatarEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Star Wars App',
        theme: AppTheme.theme,
        routes: AppRoutes.routes,
      ),
    );
  }
}
