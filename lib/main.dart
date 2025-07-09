import 'package:finance_app/root_service_locator.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RootServiceLocator().registerBefore();
  await RootServiceLocator().registerAfter();
  runApp(const AppWidget());
}
