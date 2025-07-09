import 'package:core/core.dart';
import 'package:finance_app/src/shared/stores/app_theme_store.dart';

class AppModuleServiceLocator implements AppServiceLocatorModule {
  @override
  Future<void> preRegister() async {
    sl.registerSingleton<AppThemeStore>(AppThemeStore());
  }

  @override
  Future<void> registerServices() async {}

  @override
  Future<void> registerData() async {}

  @override
  Future<void> registerBusiness() async {}

  @override
  Future<void> registerPresentation() async {}
}
