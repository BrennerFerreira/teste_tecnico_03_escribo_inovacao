import 'package:flutter/material.dart';

import 'app/app.dart';
import 'injection.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}
