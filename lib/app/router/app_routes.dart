import '../../modules/home/home_page.dart';
import '../../modules/official_website/official_website_page.dart';
import 'route_names.dart';

/// AppRoutes sets up all routes, redirecting to the correct page.
class AppRoutes {
  /// routes maps the routes names to the page.
  static final routes = {
    RouteNames.homeRoute: (_) => HomePage(),
    RouteNames.websiteRoute: (_) => OfficialWebsitePage(),
  };
}
