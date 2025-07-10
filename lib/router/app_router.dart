import 'package:finance_app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String home = '/home';

  static MaterialPageRoute<dynamic>? routes(RouteSettings settings) {
    Widget? page;
    switch (settings.name) {
      case AppRouter.welcome:
        // If need to get arguments, uncomment the next line
        // final Map<String, dynamic> args = settings.arguments! as Map<String, Object>;
        page = HomePage();
      case AppRouter.home:
        // If need to get arguments, uncomment the next line
        // final Map<String, dynamic> args = settings.arguments! as Map<String, Object>;
        page = HomePage();
      default:
        return null;
    }
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => page!, settings: settings);
  }
}
