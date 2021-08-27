import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared/movie/model/movie.dart';
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
    const moviesPath = 'films';
    try {
      final response = await _client.get(
        moviesPath,
      );

      final resultsString = response.data["results"];

      final resultsList = List.castFrom<dynamic, Map<String, dynamic>>(
        resultsString as List,
      );

      final moviesList = resultsList
          .map(
            (movieMap) => Movie.fromMap(movieMap),
          )
          .toList();

      return moviesList;
    } on DioError {
      return [];
    }
  }
}
