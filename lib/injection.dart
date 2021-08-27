import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// [getIt] is a helper to access the [GetIt] instance througout the app.
final getIt = GetIt.instance;

/// [configureDependencies] is a function that sets up all dependencies
/// injections needed in the app.
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
