import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/domain/entities/next_event_mock_builder.dart';
import '../../support/services/faker_service.dart';

void main() {
  late String id;
  late String name;
  late DateTime date;
  late NextEventPlayer player;

  setUp(() {
    id = FakerService.randomId();
    name = FakerService.randomName();
    date = FakerService.randomDate();
    player = NextEventPlayer(
      id: FakerService.randomId(),
      name: FakerService.randomName(),
      isConfirmed: FakerService.randomBool(),
    );
  });

  test('Should create a NextEvent entity', () {
    final event = NextEvent(id: id, name: name, date: date, players: [player]);
    expect(event.name, name);
    expect(event.date, date);
    expect(event.players, [player]);
  });

  test('Should convert to JSON', () {
    final event = NextEventMockBuilder().build();
    final json = event.toJson();
    expect(json['id'], event.id);
    expect(json['name'], event.name);
    expect(json['date'], event.date.toIso8601String());
    expect(json['players'], isA<List<dynamic>>());
    event.players.asMap().forEach((index, player) {
      final playerJson = json['players'][index];
      expect(playerJson, player.toJson());
    });
  });
}
