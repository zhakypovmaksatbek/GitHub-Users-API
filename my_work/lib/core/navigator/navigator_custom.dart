import 'package:flutter/material.dart';
import 'package:my_work/feature/screens/detail_screen.dart';
import 'package:my_work/feature/screens/home/home_screen.dart';
import 'package:my_work/feature/screens/splash_screen.dart';

import '../../model/user_detail.dart';
import 'navigate_routes.dart';

mixin NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateNormal(const HomeScreen());
    }
    if (routeSettings.name == NavigatorRoute.paraf) {
      return _navigateNormal(const SplashScreen());
    }
    final routes = routeSettings.name == NavigatorRoute.paraf
        ? NavigateRoutes.home
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));
    switch (routes) {
      case NavigateRoutes.home:
        return _navigateNormal(const HomeScreen());

        
      case NavigateRoutes.detail:
        final arguments = routeSettings.arguments as UserDetail?;

        if (arguments != null) {
          return _navigateNormal(UserDetailScreen(user: arguments));
        }
        return null;
     
    }
  }

  Route<dynamic>? _navigateNormal(Widget child, {bool? isFullscreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullscreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
