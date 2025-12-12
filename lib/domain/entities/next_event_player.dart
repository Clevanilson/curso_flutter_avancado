class NextEventPlayer {
  String id;
  String name;
  String initials;
  String? photoUrl;
  String? position;
  bool isConfirmed;
  DateTime? confirmationDate;

  NextEventPlayer._({
    required this.id,
    required this.name,
    required this.isConfirmed,
    required this.initials,
    this.photoUrl,
    this.position,
    this.confirmationDate,
  });

  factory NextEventPlayer({
    required String id,
    required String name,
    required bool isConfirmed,
    String? photoUrl,
    String? position,
    DateTime? confirmationDate,
  }) => NextEventPlayer._(
    id: id,
    name: name,
    isConfirmed: isConfirmed,
    photoUrl: photoUrl,
    position: position,
    confirmationDate: confirmationDate,
    initials: _getInitials(name),
  );

  factory NextEventPlayer.fromJson(Map<String, dynamic> json) =>
      NextEventPlayer(
        id: json['id'],
        name: json['name'],
        isConfirmed: json['isConfirmed'],
        confirmationDate: json['confirmationDate'] != null
            ? DateTime.parse(json['confirmationDate'])
            : null,
        photoUrl: json['photoUrl'],
        position: json['position'],
      );

  static String _getInitials(String name) {
    final names = name.toUpperCase().trim().split(' ');
    final firstChar = names.first.split('').firstOrNull ?? '';
    final lastChar = names.length > 1 ? names.last[0] : '';
    return '$firstChar$lastChar' == '' ? '-' : '$firstChar$lastChar';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isConfirmed': isConfirmed,
    'confirmationDate': confirmationDate?.toIso8601String(),
    'photoUrl': photoUrl,
    'position': position,
  };
}
