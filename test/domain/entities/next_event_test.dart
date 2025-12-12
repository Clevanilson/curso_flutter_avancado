import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/faker_service.dart';

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
}
