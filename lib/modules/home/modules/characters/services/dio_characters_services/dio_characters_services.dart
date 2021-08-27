import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared/character/model/character.dart';
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

  @override
  Future<List<Character>> getAllCharacters() async {
    Character fromMapFunction(Map<String, dynamic> map) =>
        Character.fromMap(map);
    const baseUrl = 'people';

    try {
      final response = await _client.get(baseUrl);

      final resultsString = response.data["results"];

      final charactersList = ConvertApiResponses.convertResponse<Character>(
        jsonList: resultsString as List,
        fromMapFunction: fromMapFunction,
      );

      return charactersList;
    } on DioError {
      return [];
    }
  }
}
