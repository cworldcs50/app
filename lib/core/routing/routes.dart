import 'app_routes.dart';
import 'package:flutter/material.dart';
import '../../features/home/view/home.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.kHome:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("Sorry, "))),
        );
    }
  }
}
