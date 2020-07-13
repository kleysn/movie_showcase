import 'package:flutter_test/flutter_test.dart';
import 'package:movie_showcase/widgets/utils.dart';

void main() {
  setUp(() {});
  group("Testes unitários", () {
    // Green test
    test('get month name', () {
      String monthName = Utils.getMonthName(number: '05');
      expect(monthName, 'MAIO');
    });

    // Red test
    test('get month name invalid', () {
      String monthName = Utils.getMonthName(number: '33');
      expect(monthName, '');
    });
  });
}
