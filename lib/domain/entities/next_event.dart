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

  factory NextEvent.fromJson(Map<String, dynamic> json) => NextEvent(
    id: json['id'],
    name: json['name'],
    date: DateTime.parse(json['date']),
    players: (json['players'] as List<dynamic>)
        .map(
          (playerJson) =>
              NextEventPlayer.fromJson(playerJson as Map<String, dynamic>),
        )
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date.toIso8601String(),
    'players': players.map((player) => player.toJson()).toList(),
  };
}
