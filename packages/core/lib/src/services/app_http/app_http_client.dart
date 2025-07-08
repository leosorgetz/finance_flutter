import 'app_response.dart';

abstract class AppHttpClient {
  Future<AppHttpResponse> get(
    String endpoint, {
    Map<String, String>? headers,
  });

  Future<AppHttpResponse> patch(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<AppHttpResponse> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<AppHttpResponse> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<AppHttpResponse> delete(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  });
}
