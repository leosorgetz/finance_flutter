import 'package:core/core.dart';
import 'package:core/src/services/app_http/app_http_client_impl.dart';

class CoreServiceLocator implements AppServiceLocatorModule {
  @override
  Future<void> preRegister() async {
    sl.registerSingleton<AppHttpClient>(AppHttpClientImpl());
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
