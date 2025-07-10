import 'package:finance_app/di/root_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app_widget.dart';

Future<void> main() async {
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await RootServiceLocator().registerBefore();
  await RootServiceLocator().registerAfter();
  FlutterNativeSplash.remove();
  runApp(const AppWidget());
}
