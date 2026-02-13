import '../../features/silver/data/repo/silver_repo.dart';
import 'app_routes.dart';
import 'package:flutter/material.dart';
import '../../features/home/home.dart';
import '../../features/gold/data/repo/gold_repo.dart';
import '../../features/gold/presentation/screens/gold.dart';
import '../../features/silver/presentation/screens/silver.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.kHome:
        return MaterialPageRoute(builder: (context) => const Home());
      case AppRoutes.kGold:
        return MaterialPageRoute(
          builder: (context) {
            final GoldRepo goldRepo = GoldRepo();
            return Gold(goldRepo: goldRepo);
          },
        );
      case AppRoutes.kSilver:
        return MaterialPageRoute(
          builder: (context) {
            final SilverRepo silverRepo = SilverRepo();
            return Silver(silverRepo: silverRepo);
          },
        );
      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text("Sorry, Error"))),
        );
    }
  }
}
