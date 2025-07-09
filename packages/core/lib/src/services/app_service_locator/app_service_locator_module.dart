abstract class AppServiceLocatorModule {
  Future<void> preRegister();

  Future<void> registerServices();

  Future<void> registerData();

  Future<void> registerBusiness();

  Future<void> registerPresentation();
}
