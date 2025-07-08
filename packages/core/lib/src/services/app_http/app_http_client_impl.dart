import 'dart:convert';

import 'package:http/http.dart';

import '../failures/failures.dart';
import 'app_http_client.dart';
import 'app_response.dart';

class AppHttpClientImpl implements AppHttpClient {
  final Client _httpClient = Client();
  static const String _defaultMessage =
      'Ocorreu um erro, tente novamente mais tarde.';

  @override
  Future<AppHttpResponse> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final Response res = await _httpClient.get(
        Uri.parse(endpoint),
        headers: headers,
      );
      return AppHttpResponse(
        body: utf8.decode(res.bodyBytes),
        statusCode: res.statusCode,
      );
    } catch (_) {
      throw HttpFailure(_defaultMessage);
    }
  }

  @override
  Future<AppHttpResponse> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await _httpClient.post(
        Uri.parse(endpoint),
        body: json.encode(body),
        headers: headers,
      );
      return AppHttpResponse(
        body: utf8.decode(res.bodyBytes),
        statusCode: res.statusCode,
      );
    } catch (_) {
      throw HttpFailure(_defaultMessage);
    }
  }

  @override
  Future<AppHttpResponse> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await _httpClient.put(
        Uri.parse(endpoint),
        body: json.encode(body),
        headers: headers,
      );
      return AppHttpResponse(
        body: utf8.decode(res.bodyBytes),
        statusCode: res.statusCode,
      );
    } catch (_) {
      throw HttpFailure(_defaultMessage);
    }
  }

  @override
  Future<AppHttpResponse> delete(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await _httpClient.delete(
        Uri.parse(endpoint),
        headers: headers,
      );
      return AppHttpResponse(
        body: utf8.decode(res.bodyBytes),
        statusCode: res.statusCode,
      );
    } catch (_) {
      throw HttpFailure(_defaultMessage);
    }
  }

  @override
  Future<AppHttpResponse> patch(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await _httpClient.patch(
        Uri.parse(endpoint),
        body: json.encode(body),
        headers: headers,
      );
      return AppHttpResponse(
        body: utf8.decode(res.bodyBytes),
        statusCode: res.statusCode,
      );
    } catch (_) {
      throw HttpFailure(_defaultMessage);
    }
  }
}
