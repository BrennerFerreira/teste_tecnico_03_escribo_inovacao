// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'modules/home/modules/movies/controllers/movies_bloc.dart' as _i6;
import 'modules/home/modules/movies/services/dio_movies_services/dio_movies_services.dart'
    as _i5;
import 'modules/home/modules/movies/services/i_movies_services.dart' as _i4;
import 'modules/home/modules/shared/dio_config/dio_config.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DioConfig>(() => _i3.DioConfig());
  gh.factory<_i4.IMoviesServices>(
      () => _i5.DioMoviesServices(get<_i3.DioConfig>()));
  gh.factory<_i6.MoviesBloc>(() => _i6.MoviesBloc(get<_i4.IMoviesServices>()));
  return get;
}
