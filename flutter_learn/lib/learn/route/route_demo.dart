import 'package:flutter/material.dart';

import 'route.dart';

class RouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RouteManager.routes,
      initialRoute: RouteManager.initialRoute,
      onGenerateRoute: RouteManager.onGenerateRoute,
      onUnknownRoute: RouteManager.onUnknownRoute,
    );
  }
}
