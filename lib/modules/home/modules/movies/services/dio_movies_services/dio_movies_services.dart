import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared/movie/movie.dart';
import '../../../shared/dio_config/dio_config.dart';
import '../i_movies_services.dart';

/// [DioMoviesServices] is a class that encapsulates all API requests using
/// the [Dio] package.
@Injectable(as: IMoviesServices)
class DioMoviesServices implements IMoviesServices {
  /// The [DioConfig] to make the requests.
  final DioConfig config;
  late Dio _client;

  /// Default constructor of the [DioMoviesServices] class.
  DioMoviesServices(this.config) {
    _client = config.client;
  }

  @override
  Future<List<Movie>> getAllMovies() async {
    const moviesPath = '/movies';

    try {
      final response = await _client.get(
        moviesPath,
      );

      print(response.data);
      return [];
    } on DioError {
      return [];
    }
  }
}
