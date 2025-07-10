import 'package:finance_app/src/presentation/home/home_page.dart';
import 'package:finance_app/src/presentation/login/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String login = '/login';
  static const String home = '/home';

  static MaterialPageRoute<dynamic>? routes(RouteSettings settings) {
    Widget? page;
    switch (settings.name) {
      case AppRouter.login:
        // If need to get arguments, uncomment the next line
        // final Map<String, dynamic> args = settings.arguments! as Map<String, Object>;
        page = LoginPage();
        break;
      case AppRouter.home:
        // If need to get arguments, uncomment the next line
        // final Map<String, dynamic> args = settings.arguments! as Map<String, Object>;
        page = HomePage();
        break;
      default:
        return null;
    }
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => page!, settings: settings);
  }
}
