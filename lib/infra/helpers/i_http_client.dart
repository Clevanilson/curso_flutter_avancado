import 'package:curso_flutter_avancado/infra/helpers/http_method.dart';

abstract class IHttpClient {
  Future<HttpResponse> makeRequest({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? body,
  });
}

class HttpResponse {
  final int status;
  final Map<String, dynamic> body;

  HttpResponse({required this.status, required this.body});
}
