import 'package:finance_app/router/app_router.dart';
import 'package:finance_app/src/shared/pages/not_found/not_found_page.dart';
import 'package:flutter/material.dart';

class AppRootRouter {
  static const String initialRoute = '/login';

  static final List<MaterialPageRoute<dynamic>? Function(RouteSettings settings)> _routes =
      <MaterialPageRoute<dynamic>? Function(RouteSettings settings)>[
        AppRouter.routes,
        // Others router files here, ex: AnotherModuleRouter.routes,
      ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (final MaterialPageRoute<dynamic>? Function(RouteSettings settings) route in _routes) {
      final MaterialPageRoute<dynamic>? result = route(settings);
      if (result != null) {
        return result;
      }
    }
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => const NotFoundPage(), settings: settings);
  }

  static List<Route<void>> onGenerateInitialRoutes(String initialRouteName) {
    // Set rule to user logged to redirect to home page
    // if (userIsLogged) {
    //   return <Route<void>>[
    //     AppRootRouter.onGenerateRoute(RouteSettings(name: AppRouter.home)),
    //   ];
    // }

    return <Route<void>>[
      AppRootRouter.onGenerateRoute(RouteSettings(name: AppRouter.home)),
    ];
    // return <Route<void>>[AppRootRouter.onGenerateRoute(RouteSettings(name: initialRouteName))];
  }
}
