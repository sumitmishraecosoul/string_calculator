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
      expect(calculator.add('42'), equals(42));
    });

    test('should add two comma-separated numbers', () {
      expect(calculator.add('1,5'), equals(6));
      expect(calculator.add('10,20'), equals(30));
    });

    test('should add any amount of numbers', () {
      expect(calculator.add('1,2,3'), equals(6));
      expect(calculator.add('1,2,3,4,5'), equals(15));
    });

    test('should handle newlines as delimiters', () {
      expect(calculator.add('1\n2,3'), equals(6));
      expect(calculator.add('1\n2\n3'), equals(6));
    });

    test('should support custom single-character delimiters', () {
      expect(calculator.add('//;\n1;2'), equals(3));
      expect(calculator.add('//|\n1|2|3'), equals(6));
    });

    test('should throw exception for negative numbers', () {
      expect(() => calculator.add('-1'), throwsA(predicate((e) => 
        e.toString().contains('negative numbers not allowed -1'))));
      
      expect(() => calculator.add('2,-4,3,-5'), throwsA(predicate((e) => 
        e.toString().contains('negative numbers not allowed -4,-5'))));
    });
  });
}
