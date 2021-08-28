import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared/star_wars_item/models/character.dart';
import '../../../shared/dio_config/dio_config.dart';
import '../../../shared/services/convert_api_response.dart';
import '../i_characters_services.dart';

/// [DioCharactersServices] is a class that implements the [ICharactersService]
/// interface and encapsulates all API requests using the [Dio] package.
@Injectable(as: ICharactersServices)
class DioCharactersServices implements ICharactersServices {
  final DioConfig _config;
  late Dio _client;

  /// Default constructor of the [DioCharactersServices] class.
  DioCharactersServices(this._config) {
    _client = _config.client;
  }

  Character _fromMapFunction(Map<String, dynamic> map) =>
      Character.fromMap(map);

  final String _baseUrl = 'people';

  @override
  Future<List<Character>> getAllCharacters() async {
    try {
      final response = await _client.get(_baseUrl);

      final resultsString = response.data["results"];

      final charactersList = ConvertApiResponses.convertResponse<Character>(
        jsonList: resultsString as List,
        fromMapFunction: _fromMapFunction,
      );

      return charactersList;
    } on DioError {
      return [];
    }
  }

  @override
  Future<List<Character>> getNewPageOfCharacters(int page) async {
    try {
      final response = await _client.get(
        _baseUrl,
        queryParameters: {"page": page},
      );

      final resultsString = response.data["results"];

      final charactersList = ConvertApiResponses.convertResponse<Character>(
        jsonList: resultsString as List,
        fromMapFunction: _fromMapFunction,
      );

      return charactersList;
    } on DioError {
      return [];
    }
  }
}
