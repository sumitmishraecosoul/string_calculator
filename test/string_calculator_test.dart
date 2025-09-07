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

    test('should add two comma-separated numbers', () {
      expect(calculator.add('1,5'), equals(6));
    });

    test('should add any amount of numbers', () {
      expect(calculator.add('1,2,3'), equals(6));
    });
  });
}