import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// [DioConfig] creates the base [Dio] client used to retrived data from the API.
@injectable
class DioConfig {
  static const _baseUrl = 'https://swapi.dev/api/';

  /// [client] is the base client used to retrieve data from the API.
  final client = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );
}
