import 'package:core/core.dart';

import 'app_module_service_locator.dart';

class RootServiceLocator implements AppServiceLocatorModule {
  final List<AppServiceLocatorModule> serviceLocatorModules = <AppServiceLocatorModule>[AppModuleServiceLocator()];

  @override
  Future<void> preRegister() async {}

  @override
  Future<void> registerServices() async {
    for (final AppServiceLocatorModule service in serviceLocatorModules) {
      await service.registerServices();
    }
  }

  @override
  Future<void> registerData() async {
    for (final AppServiceLocatorModule service in serviceLocatorModules) {
      await service.registerData();
    }
  }

  @override
  Future<void> registerBusiness() async {
    for (final AppServiceLocatorModule service in serviceLocatorModules) {
      await service.registerBusiness();
    }
  }

  @override
  Future<void> registerPresentation() async {
    for (final AppServiceLocatorModule service in serviceLocatorModules) {
      await service.registerPresentation();
    }
  }

  Future<void> registerBefore() async {
    for (final AppServiceLocatorModule service in serviceLocatorModules) {
      await service.preRegister();
    }
  }

  Future<void> registerAfter() async {
    await registerServices();
    await registerData();
    await registerBusiness();
    await registerPresentation();
  }
}
