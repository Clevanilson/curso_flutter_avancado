import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';

class NextEvent {
  final String id;
  final String name;
  final DateTime date;
  final List<NextEventPlayer> players;

  NextEvent({
    required this.id,
    required this.name,
    required this.date,
    required this.players,
  });
}
