import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';

import '../../services/faker_service.dart';
import 'next_event_player_mock_builder.dart';

class NextEventMockBuilder {
  String id = FakerService.randomId();
  String name = FakerService.randomName();
  DateTime date = FakerService.randomDate();
  List<NextEventPlayer> players = [NextEventPlayerMockBuilder().build()];

  NextEventMockBuilder withId(String id) {
    this.id = id;
    return this;
  }

  NextEventMockBuilder withName(String name) {
    this.name = name;
    return this;
  }

  NextEventMockBuilder withDate(DateTime date) {
    this.date = date;
    return this;
  }

  NextEventMockBuilder withPlayers(List<NextEventPlayer> players) {
    this.players = players;
    return this;
  }

  NextEvent build() {
    return NextEvent(id: id, name: name, date: date, players: players);
  }
}
