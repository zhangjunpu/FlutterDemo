import 'package:flutter/material.dart';

import 'about_page.dart';
import 'home_page.dart';
import 'setting_page.dart';
import 'unknown_page.dart';

class RouteManager {
  static final String routeHome = "/";
  static final String routeSetting = "/setting";
  static final String routeAbout = "/about";

  static final Map<String, WidgetBuilder> routes = {
    routeHome: (ctx) => HomePage(),
    routeAbout: (ctx) => AboutPage(),
  };

  static final initialRoute = routeHome;

  static RouteFactory onGenerateRoute = (settings) {
    print('onGenerateRoute: $settings');
    if (settings.name == RouteManager.routeSetting) {
      return MaterialPageRoute(
          builder: (ctx) => SettingPage(settings.arguments));
    }
    return null;
  };

  static RouteFactory onUnknownRoute = (settings) {
    print('onUnknownRoute: $settings');
    return MaterialPageRoute(builder: (ctx) => UnknownPage());
  };
}
