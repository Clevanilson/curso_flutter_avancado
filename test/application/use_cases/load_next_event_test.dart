import 'package:curso_flutter_avancado/application/repositories/i_next_event_repository.dart';
import 'package:curso_flutter_avancado/application/use_cases/load_next_event.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/domain/entities/next_event_mock_builder.dart';
import '../../support/services/faker_service.dart';

class NextEventRepositorySpy implements INextEventRepository {
  String? groupId;
  int callCount = 0;
  NextEvent output = NextEventMockBuilder().build();

  @override
  Future<NextEvent> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
    callCount++;
    return output;
  }
}

void main() {
  late LoadNextEvent sut;
  late NextEventRepositorySpy repo;
  late String grouId;

  setUp(() {
    repo = NextEventRepositorySpy();
    sut = LoadNextEvent(repository: repo);
    grouId = FakerService.randomId();
  });

  test('should load the next event', () async {
    final event = await sut(groupId: grouId);
    expect(repo.groupId, grouId);
    expect(repo.callCount, 1);
    expect(event, repo.output);
  });
}
