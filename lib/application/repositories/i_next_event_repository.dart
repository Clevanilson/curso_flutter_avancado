import 'package:curso_flutter_avancado/domain/entities/next_event.dart';

abstract class INextEventRepository {
  Future<NextEvent> loadNextEvent({required String groupId});
}
