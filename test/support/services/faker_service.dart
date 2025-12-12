import 'dart:math';

class FakerService {
  static String randomId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String randomName() {
    final names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'];
    names.shuffle();
    return names.first;
  }

  static DateTime randomDate() {
    final now = DateTime.now();
    return now.add(Duration(days: Random().nextInt(30)));
  }

  static bool randomBool() {
    return Random().nextBool();
  }

  static String randomUrl() {
    final urls = [
      'https://example.com',
      'https://example.com',
      'https://example.com',
    ];
    urls.shuffle();
    return urls.first;
  }
}
