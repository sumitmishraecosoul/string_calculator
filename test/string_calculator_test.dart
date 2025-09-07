import 'package:test/test.dart';
import '../src/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    test('should return 0 for empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('should return the number for single number', () {
      expect(calculator.add('1'), equals(1));
    });
  });
}