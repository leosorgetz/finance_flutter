import 'package:core/core.dart';
import 'package:ds/ds.dart';
import 'package:finance_app/src/presentation/home/home_page.dart';
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
          title: 'Flutter Demo',
          theme: themeMode == ThemeMode.light ? appLightTheme.getTheme : appDarkTheme.getTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
