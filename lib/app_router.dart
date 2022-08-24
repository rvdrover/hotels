import 'package:flutter/material.dart';
import 'package:hotels/models/hotels.dart';
import 'package:hotels/pages/details_page/details_page.dart';
import 'package:hotels/pages/map_page/map_page.dart';

class AppRoutes {
  static const detailsPage = '/details_page';
  static const mapPage = '/map_page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.detailsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailsPage(
            hotelData: args as HotelData, //Pass Arguments to Next View
          ),
          settings: settings,
        );
      case AppRoutes.mapPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MapPage(
            hotelData: args as HotelData,
          ),
          settings: settings,
          fullscreenDialog: true,
        );

      default:
        return null;
    }
  }
}
