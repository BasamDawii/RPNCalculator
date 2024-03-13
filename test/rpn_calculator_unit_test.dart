import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/logic.calculator.dart';

void main() {
  group('RPNCalculator', () {
    late RPNCalculator calculator;

    setUp(() {
      calculator = RPNCalculator();
    });

    test('correctly adds two numbers', () {
      calculator.setInput1('5');
      calculator.setInput2('3');
      expect(calculator.calculate('+'), '8.0');
    });

    test('correctly subtracts two numbers', () {
      calculator.setInput1('10');
      calculator.setInput2('4');
      expect(calculator.calculate('-'), '6.0');
    });

    test('correctly multiplies two numbers', () {
      calculator.setInput1('6');
      calculator.setInput2('7');
      expect(calculator.calculate('*'), '42.0');
    });

    test('correctly divides two numbers', () {
      calculator.setInput1('8');
      calculator.setInput2('2');
      expect(calculator.calculate('/'), '4.00');
    });

    test('handles division by zero', () {
      calculator.setInput1('5');
      calculator.setInput2('0');
      expect(calculator.calculate('/'), 'Error');
    });

    test('returns Error for invalid operator', () {
      calculator.setInput1('5');
      calculator.setInput2('3');
      expect(calculator.calculate('x'), 'Error');
    });

    test('handles non-numeric input gracefully', () {
      calculator.setInput1('abc');
      calculator.setInput2('123');
      expect(calculator.calculate('+'), '123.0');
    });

    test('clear resets the calculator', () {
      calculator.setInput1('10');
      calculator.setInput2('20');
      calculator.calculate('+');
      calculator.clear();
      expect(calculator.result, '');
    });
  });
}