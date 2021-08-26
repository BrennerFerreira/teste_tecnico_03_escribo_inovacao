import 'package:flutter/material.dart';
import 'package:teste_tecnico_03_escribo_inovacao/app/theme/app_theme.dart';

import 'router/app_routes.dart';

/// MyApp initializes the app setting the theme and routes.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars App',
      theme: AppTheme.theme,
      routes: AppRoutes.routes,
    );
  }
}
