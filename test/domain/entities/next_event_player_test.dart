import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/domain/entities/next_event_player_mock_builder.dart';
import '../../support/services/faker_service.dart';

void main() {
  String initialsOf(String name) =>
      NextEventPlayer(id: 'any_id', name: name, isConfirmed: false).initials;

  late String id;
  late String name;
  late DateTime confirmationDate;
  late bool isConfirmed;
  late String photoUrl;
  late String position;

  setUp(() {
    id = FakerService.randomId();
    name = FakerService.randomName();
    confirmationDate = FakerService.randomDate();
    isConfirmed = FakerService.randomBool();
    photoUrl = FakerService.randomUrl();
    position = FakerService.randomName();
  });

  test('Should create a NextEventPlayer entity', () {
    final player = NextEventPlayer(
      id: id,
      name: name,
      isConfirmed: isConfirmed,
      confirmationDate: confirmationDate,
      photoUrl: photoUrl,
      position: position,
    );
    expect(player.id, id);
    expect(player.name, name);
    expect(player.isConfirmed, isConfirmed);
    expect(player.confirmationDate, confirmationDate);
    expect(player.photoUrl, photoUrl);
    expect(player.position, position);
  });

  test('should return the first letter of the first and last name', () {
    expect(initialsOf('Clevanilson Oliveira'), 'CO');
    expect(initialsOf('Eren Yeager'), 'EY');
    expect(initialsOf('Ardyn Lucis Caelum'), 'AC');
  });

  test('should return only the first letter if the name has only one word', () {
    expect(initialsOf('Ezio'), 'E');
  });

  test('Should make the letters uppercase', () {
    expect(initialsOf('clevanilson oliveira'), 'CO');
    expect(initialsOf('eren yeager'), 'EY');
    expect(initialsOf('ARDYN LUCIS CAELUM'), 'AC');
    expect(initialsOf('ezio'), 'E');
  });

  test('Should remove extra spaces', () {
    expect(initialsOf('  Clevanilson    Oliveira  '), 'CO');
    expect(initialsOf('   Eren    Yeager'), 'EY');
    expect(initialsOf('Ardyn    Lucis   Caelum   '), 'AC');
    expect(initialsOf('   Ezio   '), 'E');
  });

  test('Should return - if the name is empty', () {
    expect(initialsOf(''), '-');
    expect(initialsOf('  '), '-');
  });

  test('Should convert to json', () {
    final player = NextEventPlayerMockBuilder().build();
    final json = player.toJson();
    expect(json['id'], player.id);
    expect(json['name'], player.name);
    expect(json['isConfirmed'], player.isConfirmed);
    expect(
      json['confirmationDate'],
      player.confirmationDate?.toIso8601String(),
    );
    expect(json['photoUrl'], player.photoUrl);
    expect(json['position'], player.position);
  });
}
