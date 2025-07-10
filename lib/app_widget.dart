import 'package:core/core.dart';
import 'package:ds/ds.dart';
import 'package:finance_app/router/root_router.dart';
import 'package:finance_app/src/shared/stores/app_theme_store.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemeStore appThemeStore = sl<AppThemeStore>();
    final AppLightTheme appLightTheme = AppLightTheme();
    final AppDarkTheme appDarkTheme = AppDarkTheme();

    return ValueListenableBuilder(
      valueListenable: appThemeStore.themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Finance App',
          theme: themeMode == ThemeMode.light ? appLightTheme.getTheme : appDarkTheme.getTheme,
          initialRoute: AppRootRouter.initialRoute,
          onGenerateInitialRoutes: (String initialRouteName) => AppRootRouter.onGenerateInitialRoutes(initialRouteName),
          onGenerateRoute: AppRootRouter.onGenerateRoute,
        );
      },
    );
  }
}
