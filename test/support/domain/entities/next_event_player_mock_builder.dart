import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';

import '../../services/faker_service.dart';

class NextEventPlayerMockBuilder {
  String _id = FakerService.randomId();
  String _name = FakerService.randomName();
  bool _isConfirmed = FakerService.randomBool();

  NextEventPlayerMockBuilder withId(String id) {
    _id = id;
    return this;
  }

  NextEventPlayerMockBuilder withName(String name) {
    _name = name;
    return this;
  }

  NextEventPlayerMockBuilder withIsConfirmed(bool isConfirmed) {
    _isConfirmed = isConfirmed;
    return this;
  }

  NextEventPlayer build() {
    return NextEventPlayer(id: _id, name: _name, isConfirmed: _isConfirmed);
  }
}
