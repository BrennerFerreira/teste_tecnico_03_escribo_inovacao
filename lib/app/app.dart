import 'package:flutter/material.dart';

import 'router/app_routes.dart';

/// MyApp initializes the app setting the theme and routes.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoutes.routes,
    );
  }
}
