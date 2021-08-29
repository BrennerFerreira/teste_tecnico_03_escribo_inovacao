import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:teste_tecnico_03_escribo_inovacao/shared/constants/constants.dart';

/// [DioConfig] creates the base [Dio] client used to retrived data from the API.
@injectable
class DioConfig {
  /// [client] is the base client used to retrieve data from the API.
  final client = Dio(
    BaseOptions(baseUrl: AppConstants.apiBaseUrl),
  );
}
