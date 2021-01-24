import 'package:dio/dio.dart';
import 'package:loja_virtual/shared/device/connection.dart';
import 'package:loja_virtual/shared/resources/strings.dart';

import 'endpoints.dart';
import 'http_code.dart';

class CustomHttpClient {
  static const String _APPLICATION_JSON = "application/json";
  // static const String _APPLICATION_FORM_DATA = "multipart/form-data";
  static const String _CONTENT_TYPE = "Content-Type";
  static const String _AUTHORIZATION = "Authorization";
  static const int _TIME_OUT = 30000;

  Dio _client;

  CustomHttpClient() {
    ConnectionHelper.hasConnection().then((value) {
      if (!value) throw Exception(NO_CONNECTION);
    });

    _client = Dio();

    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        options.connectTimeout = _TIME_OUT;
        options.receiveTimeout = _TIME_OUT;
        return options;
      },
      onResponse: (response) => response,
      onError: _onError,
    ));

    _client.options.baseUrl = BASE_URL;
    // If you prefer have your base url in some environment variables file
    // _client.options.baseUrl = DotEnv().env[QueryParam.BASE_URL];
  }

  Future<Response> get(String url) async {
    await _interceptor();
    return _client.get(url);
  }

  Future<Response> getCC(String url) async {
    await _bearerTokenInterceptor();
    return _client.get(url);
  }

  Future<Response> post(String url, {dynamic body}) async {
    await _interceptor();
    return _client.post(url, data: body);
  }

  Future<Response> put(String url, {dynamic body}) async {
    await _interceptor();
    return _client.put(url, data: body);
  }

  Future<Response> delete(String url, {dynamic body}) async {
    await _interceptor();
    return _client.delete(url);
  }

  Future _interceptor() async {
    Map<String, dynamic> headers = {};
    headers[_CONTENT_TYPE] = _APPLICATION_JSON;
    _client.options.headers = headers;
  }

  Future _bearerTokenInterceptor() async {
    Map<String, dynamic> headers = {};
    headers[_CONTENT_TYPE] = _APPLICATION_JSON;
    headers[_AUTHORIZATION] = 'Bearer here-you-will-take-the-auth-token';
    _client.options.headers = headers;
  }

  _onError(DioError error) {
    if (error.response?.statusCode == HttpCode.UNAUTHORIZED) {
      _client.interceptors.requestLock.lock();
      _client.interceptors.responseLock.lock();

      RequestOptions options = error.response.request;
      _client.interceptors.requestLock.unlock();
      _client.interceptors.responseLock.unlock();

      return _client.request(options.path, options: options);
    } else {
      return error;
    }
  }
}
