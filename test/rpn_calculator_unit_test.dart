import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/logic.calculator.dart';

void main() {
  group('RPNCalculator', () {
    test('should push value onto the stack', () {
      final calculator = RPNCalculator();
      calculator.push(5);
      expect(calculator.stack, equals([5]));
    });

    test('should add two values', () {
      final calculator = RPNCalculator();
      calculator.push(1);
      calculator.push(2);
      calculator.add();
      expect(calculator.stack.last, equals(3));
    });

    test('should subtract two values', () {
      final calculator = RPNCalculator();
      calculator.push(5);
      calculator.push(3);
      calculator.subtract();
      expect(calculator.stack.last, equals(2));
    });

    test('should multiply two values', () {
      final calculator = RPNCalculator();
      calculator.push(2);
      calculator.push(4);
      calculator.multiply();
      expect(calculator.stack.last, equals(8));
    });

    test('should divide two values', () {
      final calculator = RPNCalculator();
      calculator.push(8);
      calculator.push(2);
      calculator.divide();
      expect(calculator.stack.last, equals(4));
    });

    test('should clear the stack', () {
      final calculator = RPNCalculator();
      calculator.push(1);
      calculator.push(2);
      calculator.clear();
      expect(calculator.stack.isEmpty, isTrue);
    });


    test('should not perform operation with insufficient stack values', () {
      final calculator = RPNCalculator();
      calculator.push(3);
      calculator.add();
      expect(calculator.stack, equals([3]));
    });
  });
}
