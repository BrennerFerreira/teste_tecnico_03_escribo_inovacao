/// AppConstants holds all hard coded values, such as strings or numbers
/// there are used in the app.
class AppConstants {
  /**
   * Constants related to classes attributes:
   */

  /// Redirects to the string 'isFavorite'
  static const isFavoriteAttribute = 'isFavorite';

  /// Redirects to the string 'name'
  static const nameAttribute = 'name';

  /// Redirects to the string 'title'.
  static const titleAttribute = 'title';

  /// Redirects to the string 'itemType'
  static const typeAttribute = 'itemType';

  /**
   * Constants related to external data:
   */

  /// Redirects to the string 'https://swapi.dev/api/'
  static const apiBaseUrl = 'https://swapi.dev/api/';

  /// Redirects to the string 'https://www.starwars.com/community'
  static const communityWebsiteUrl = 'https://www.starwars.com/community';

  /// Redirects to the string 'page'
  static const pageString = 'page';

  /// Redirects to the string 'people'
  static const charactersBaseUrl = 'people';

  /// Redirects to the string 'films'
  static const moviesBaseUrl = 'films';

  /// Redirects to the string 'results'
  static const resultsString = 'results';

  /**
   * Constants related to database:
   */

  /// Redirects to the string 'avatarTable'
  static const avatarTable = 'avatarTable';

  /// Redirects to the string 'config'
  static const configString = 'config';

  /// Redirects to the string 'databasePath'
  static const databasePath = './star_wars_app.db';

  /// Redirects to the string 'favoritesTable'
  static const favoritesTable = 'favoritesTable';

  /// Redirects to the string 'id'
  static const idString = 'id';

  /**
   * Constants related to UI:
   */

  /// Redirects to the string 'Favoritos Star Wars'.
  static const appTitle = 'Favoritos Star Wars';

  /// Redirects to the string 'Mude seu avatar:'.
  static const avatarSelectionTitle = 'Mude seu avatar:';

  /// Redirects to the string 'Personagens'.
  static const charactersTabTitle = 'Personagens';

  /// Redirects to the string 'Nenhum item foi marcado como favorito!'.
  static const emptyFavoritesText = 'Nenhum item foi marcado como favorito!';

  /// Redirects to the string 'Erro ao recuperar os dados do servidor. Por favor, tente novamente.'.
  static const errorText =
      'Erro ao recuperar os dados do servidor. Por favor, tente novamente.';

  /// Redirects to the string 'Favoritos'.
  static const favoritesTabTitle = 'Favoritos';

  /// Redirects to the string 'Filmes'.
  static const moviesTabTitle = 'Filmes';

  /// Redirects to the string 'Site Oficial'.
  static const website = 'Site Oficial';

  /// Redirects to the double 144.0;
  static const fullAppBarHeight = 144.0;

  /// Redirects to the int 3.
  static const homePageTabsQuantity = 3;

  /// Redirects to the double 124.0;
  static const smallAppBarHeight = 124.0;
}
