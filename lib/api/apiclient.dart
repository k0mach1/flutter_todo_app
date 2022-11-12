import 'dart:io';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<String> get(String endpoint);
  Future<String> post(String endpoint, { required String body });
  Future<String> put(String endpoint, { required String body });
  Future<String> delete(String endpoint);
}

class ApiClientImpl implements ApiClient {

  factory ApiClientImpl({ String baseUrl = '10.0.2.2:8080' }) {
    return _instance ??= ApiClientImpl._internal(baseUrl);
  }

  ApiClientImpl._internal(this.baseUrl);

  static ApiClientImpl? _instance;

  final String baseUrl;

  static const headers = <String, String>{'content-type': 'application/json'};

  Future<String> _safeApiCall(Function callback) async {
    try {
      final response = await callback() as http.Response;
      return _parseResponse(response.statusCode, response.body);
    } on SocketException {
      throw Exception('No Internet Connection');
    }
  }

  @override
  Future<String> get(String endpoint) async {
    return _safeApiCall(() async => http.get(Uri.http(baseUrl, endpoint)));
  }

  @override
  Future<String> post(String endpoint, { required String body }) async {
    return _safeApiCall(() async =>
        http.post(Uri.http(baseUrl, endpoint), headers: headers, body: body));
  }

  @override
  Future<String> put(String endpoint, { required String body }) async {
    return _safeApiCall(() async =>
        http.put(Uri.http(baseUrl, endpoint), headers: headers, body: body));
  }

  @override
  Future<String> delete(String endpoint) async {
    return _safeApiCall(() async => http.delete(Uri.http(baseUrl, endpoint)));
  }

  String _parseResponse(int httpStatus, String responseBody) {
    switch (httpStatus) {
      case 200:
      case 201:
        return responseBody;
        break;
      case 400:
        throw Exception('400 Bad Request');
        break;
      case 401:
        throw Exception('401 Unauthorized');
        break;
      case 403:
        throw Exception('403 Forbidden');
        break;
      case 404:
        throw Exception('404 Not Found');
        break;
      case 405:
        throw Exception('405 Method Not Allowed');
        break;
      case 500:
        throw Exception('500 Internal Server Error');
        break;
      default:
        throw Exception('Http status $httpStatus unknown error.');
        break;
    }
  }
}