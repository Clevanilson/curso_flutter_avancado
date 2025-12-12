import 'package:curso_flutter_avancado/infra/helpers/http_method.dart';
import 'package:curso_flutter_avancado/infra/helpers/i_http_client.dart';

class HttpClientSpy implements IHttpClient {
  int callsCount = 0;
  String? endpoint;
  HttpMethod? method;
  HttpResponse response = HttpResponse(status: 200, body: {});
  dynamic body;

  @override
  Future<HttpResponse> makeRequest({
    required String endpoint,
    required HttpMethod method,
    Map<String, dynamic>? body,
  }) async {
    this.endpoint = endpoint;
    this.method = method;
    this.body = body;
    callsCount++;
    return response;
  }
}
