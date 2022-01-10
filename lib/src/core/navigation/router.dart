import 'package:flutter/material.dart';
import 'package:flutter_hive/src/home_page/home_page.dart';
import 'package:flutter_hive/src/login_page/login_page.dart';
import 'package:flutter_hive/src/splash_page/splash_page.dart';

import 'dummy_page.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case HomePage.routeName:
        // var param = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => const HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      // case ProfileAccountPage.routeName:
      //   var param = settings.arguments as ProfileSuccess;
      //   return MaterialPageRoute(
      //     builder: (_) => ProfileAccountPage(profileSuccess: param),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => DummyScreen(
            name: 'No route defined for ${settings.name}',
          ),
        );
    }
  }
}
