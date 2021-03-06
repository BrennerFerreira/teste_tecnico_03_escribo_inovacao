// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'modules/home/modules/characters/controllers/characters_bloc.dart'
    as _i16;
import 'modules/home/modules/characters/services/dio_characters_services/dio_characters_services.dart'
    as _i5;
import 'modules/home/modules/characters/services/i_characters_services.dart'
    as _i4;
import 'modules/home/modules/movies/controllers/movies_bloc.dart' as _i15;
import 'modules/home/modules/movies/services/dio_movies_services/dio_movies_services.dart'
    as _i9;
import 'modules/home/modules/movies/services/i_movies_services.dart' as _i8;
import 'modules/home/modules/shared/dio_config/dio_config.dart' as _i3;
import 'shared/avatar/controllers/avatar_bloc.dart' as _i13;
import 'shared/avatar/services/i_avatar_services.dart' as _i11;
import 'shared/avatar/services/sqflite_avatar_services/sqflite_avatar_services.dart'
    as _i12;
import 'shared/database/services/i_database_services.dart' as _i6;
import 'shared/database/services/sqflite_database_services/sqflite_database_services.dart'
    as _i7;
import 'shared/favorites/controllers/favorites_bloc.dart' as _i14;
import 'shared/favorites/services/favorites_services.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DioConfig>(() => _i3.DioConfig());
  gh.factory<_i4.ICharactersServices>(
      () => _i5.DioCharactersServices(get<_i3.DioConfig>()));
  gh.factory<_i6.IDatabaseServices>(() => _i7.SqfliteDatabaseServices());
  gh.factory<_i8.IMoviesServices>(
      () => _i9.DioMoviesServices(get<_i3.DioConfig>()));
  gh.factory<_i10.FavoritesServices>(
      () => _i10.FavoritesServices(get<_i6.IDatabaseServices>()));
  gh.factory<_i11.IAvatarServices>(
      () => _i12.SqfliteAvatarServices(get<_i6.IDatabaseServices>()));
  gh.factory<_i13.AvatarBloc>(
      () => _i13.AvatarBloc(get<_i11.IAvatarServices>()));
  gh.factory<_i14.FavoritesBloc>(
      () => _i14.FavoritesBloc(get<_i10.FavoritesServices>()));
  gh.factory<_i15.MoviesBloc>(() =>
      _i15.MoviesBloc(get<_i8.IMoviesServices>(), get<_i14.FavoritesBloc>()));
  gh.factory<_i16.CharactersBloc>(() => _i16.CharactersBloc(
      get<_i4.ICharactersServices>(), get<_i14.FavoritesBloc>()));
  return get;
}
