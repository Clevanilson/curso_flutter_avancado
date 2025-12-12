import 'dart:convert';

import 'package:curso_flutter_avancado/infra/helpers/http_method.dart';
import 'package:curso_flutter_avancado/infra/helpers/i_http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientAdapter implements IHttpClient {
  final baseURL = 'http://localhost:3000/';
  final http.Client _httpClient;

  HttpClientAdapter({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  @override
  Future<HttpResponse> makeRequest({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseURL$endpoint');
    late http.Response response;

    switch (method) {
      case HttpMethod.get:
        response = await _httpClient.get(uri);
      case HttpMethod.post:
        response = await _httpClient.post(uri, body: body);
      case HttpMethod.put:
        response = await _httpClient.put(uri, body: body);
      case HttpMethod.patch:
        response = await _httpClient.patch(uri, body: body);
      case HttpMethod.delete:
        response = await _httpClient.delete(uri);
      case HttpMethod.head:
        response = await _httpClient.head(uri);
    }

    return HttpResponse(
      status: response.statusCode,
      body: jsonDecode(response.body),
    );
  }
}
