import 'package:curso_flutter_avancado/application/repositories/i_next_event_repository.dart';
import 'package:curso_flutter_avancado/domain/entities/next_event.dart';

class LoadNextEvent {
  final INextEventRepository _repository;

  LoadNextEvent({required INextEventRepository repository})
    : _repository = repository;

  Future<NextEvent> call({required String groupId}) async {
    return await _repository.loadNextEvent(groupId: groupId);
  }
}
