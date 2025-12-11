import 'package:curso_flutter_avancado/domain/entities/next_event_player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String initialsOf(String name) =>
      NextEventPlayer(id: 'any_id', name: name, isConfirmed: false).initials;

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
}
