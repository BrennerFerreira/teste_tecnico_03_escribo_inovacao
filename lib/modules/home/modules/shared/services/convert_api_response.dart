import '../../../../../shared/star_wars_item/models/star_wars_item.dart';

/// [ConvertApiResponses] is a helper class to convert the raw JSON response
/// to a list of [StarWarsItem].
class ConvertApiResponses {
  /// [convertResponse] receives two arguments:
  ///
  /// [jsonList]: the raw JSON list received from the API.
  ///
  /// [fromMapFunction]: a function to convert the maps within the list to a
  /// [StarWarsItem].
  ///
  /// returns: a list containing the items converted.
  static List<T> convertResponse<T extends StarWarsItem>({
    required List jsonList,
    required T Function(Map<String, dynamic>) fromMapFunction,
  }) {
    final resultsList = List.castFrom<dynamic, Map<String, dynamic>>(jsonList);

    final itensList = resultsList.map((map) => fromMapFunction(map)).toList();

    return itensList;
  }
}
