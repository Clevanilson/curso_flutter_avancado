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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date.toIso8601String(),
    'players': players.map((player) => player.toJson()).toList(),
  };
}
