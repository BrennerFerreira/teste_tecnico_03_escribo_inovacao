import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared/star_wars_item/models/movie.dart';
import '../../../shared/dio_config/dio_config.dart';
import '../../../shared/services/convert_api_response.dart';
import '../i_movies_services.dart';

/// [DioMoviesServices] is a class that implements the [IMoviesService]
/// interface and encapsulates all API requests using the [Dio] package.
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
    Movie fromMapFunction(Map<String, dynamic> map) => Movie.fromMap(map);
    const moviesPath = 'films';
    try {
      final response = await _client.get(moviesPath);

      final resultsString = response.data["results"];

      final moviesList = ConvertApiResponses.convertResponse<Movie>(
        jsonList: resultsString as List,
        fromMapFunction: fromMapFunction,
      );

      return moviesList;
    } on DioError {
      return [];
    }
  }
}
