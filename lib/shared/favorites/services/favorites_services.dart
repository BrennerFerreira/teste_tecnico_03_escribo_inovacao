import 'package:injectable/injectable.dart';

import '../../constants/constants.dart';
import '../../database/services/i_database_services.dart';
import '../../star_wars_item/model/star_wars_item.dart';

/// [FavoritesServices] is the connection between [FavoritesBloc] and the
/// database.
@injectable
class FavoritesServices {
  final IDatabaseServices _dbServices;

  /// Default constructor for this class.
  FavoritesServices(this._dbServices);

  /// [getAllFavorites] retrieves all saved favorites from the database.
  ///
  /// Returns: a [List<StarWarsItem>] if no error occurs and [null] otherwise.
  Future<List<StarWarsItem>?> getAllFavorites() async {
    final results = await _dbServices.getAllData(
      tableName: AppConstants.favoritesTable,
    );

    if (results != null) {
      print(results);
      return [];
    } else {
      return null;
    }
  }

  /// [saveFavorite] received one argument:
  ///
  /// [item]: the item to be save in the database.
  ///
  /// Returns: [true] if the save was successfull, [false] otherwise.
  Future<bool> saveFavorite(StarWarsItem item) async {
    final result = await _dbServices.saveData(
      tableName: AppConstants.favoritesTable,
      data: item.toMap(),
    );
    return result;
  }

  /// [removeFavorite] received one argument:
  ///
  /// [item]: the item to be removed from the database.
  ///
  /// Returns: [true] if the remove was successfull, [false] otherwise.
  Future<bool> removeFavorite(StarWarsItem item) async {
    final result = await _dbServices.removeData(
      tableName: AppConstants.favoritesTable,
      title: item.title,
    );
    return result;
  }
}
