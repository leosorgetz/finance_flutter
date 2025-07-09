import 'package:get_it/get_it.dart';

import 'app_service_locator.dart';

final sl = ServiceLocatorImpl();

class ServiceLocatorImpl implements AppServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) =>
      _getIt.registerSingleton<T>(instance, instanceName: instanceName);

  @override
  Future<void> registerSingletonAsync<T extends Object>(T instance, {String? instanceName}) async =>
      _getIt.registerSingletonAsync(() async => instance, instanceName: instanceName);

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunc, {String? instanceName}) =>
      _getIt.registerLazySingleton<T>(factoryFunc, instanceName: instanceName);

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc, {String? instanceName}) =>
      _getIt.registerFactory<T>(factoryFunc, instanceName: instanceName);

  @override
  T get<T extends Object>({String? instanceName}) => _getIt<T>(instanceName: instanceName);

  @override
  T call<T extends Object>({String? instanceName}) => _getIt<T>(instanceName: instanceName);

  @override
  void unregister<T extends Object>() => _getIt.unregister<T>();

  @override
  Future<void> reset() => _getIt.reset();

  @override
  void resetLazySingleton<T extends Object>({String? instanceName}) =>
      _getIt.resetLazySingleton<T>(instanceName: instanceName);
}
