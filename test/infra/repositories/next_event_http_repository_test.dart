import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:curso_flutter_avancado/infra/helpers/http_method.dart';
import 'package:curso_flutter_avancado/infra/helpers/i_http_client.dart';
import 'package:curso_flutter_avancado/infra/repositories/next_event_http_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/domain/entities/next_event_mock_builder.dart';
import '../../support/infra/http_client_spy.dart';
import '../../support/services/faker_service.dart';

void main() {
  late NextEvent event;
  late String groupId;
  late HttpClientSpy http;
  late NextEventHttpRepository sut;

  setUp(() {
    groupId = FakerService.randomId();
    http = HttpClientSpy();
    event = NextEventMockBuilder().build();
    http.response = HttpResponse(status: 200, body: event.toJson());
    sut = NextEventHttpRepository(http: http);
  });

  test('Should make the currect request', () async {
    final output = await sut.loadNextEvent(groupId: groupId);
    expect(http.callsCount, 1);
    expect(http.method, HttpMethod.get);
    expect(http.endpoint, 'groups/$groupId/event');
    expect(event.date, output.date);
    expect(event.id, output.id);
    expect(event.name, output.name);

    for (var i = 0; i < event.players.length; i++) {
      final eventPlayer = event.players[i];
      final outputPlayer = output.players[i];
      expect(eventPlayer.id, outputPlayer.id);
      expect(eventPlayer.name, outputPlayer.name);
      expect(eventPlayer.isConfirmed, outputPlayer.isConfirmed);
      expect(eventPlayer.confirmationDate, outputPlayer.confirmationDate);
      expect(eventPlayer.photoUrl, outputPlayer.photoUrl);
      expect(eventPlayer.position, outputPlayer.position);
    }
  });
}
