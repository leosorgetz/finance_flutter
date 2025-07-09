abstract class AppServiceLocator {
  void registerSingleton<T extends Object>(T instance);

  Future<void> registerSingletonAsync<T extends Object>(T instance, {String? instanceName});

  void registerLazySingleton<T extends Object>(T Function() factoryFunc);

  void registerFactory<T extends Object>(T Function() factoryFunc);

  T get<T extends Object>();

  T call<T extends Object>();

  void unregister<T extends Object>();

  Future<void> reset();

  void resetLazySingleton<T extends Object>({String? instanceName});
}
