import 'package:curso_flutter_avancado/application/repositories/i_next_event_repository.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:curso_flutter_avancado/infra/helpers/http_method.dart';
import 'package:curso_flutter_avancado/infra/helpers/i_http_client.dart';

class NextEventHttpRepository implements INextEventRepository {
  final IHttpClient _http;

  NextEventHttpRepository({required IHttpClient http}) : _http = http;

  @override
  Future<NextEvent> loadNextEvent({required String groupId}) async {
    final response = await _http.makeRequest(
      method: HttpMethod.get,
      endpoint: 'groups/$groupId/event',
    );
    return NextEvent.fromJson(response.body);
  }
}
