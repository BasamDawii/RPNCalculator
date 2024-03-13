// Logic for RPN Calculator
class RPNCalculator {
  List<double> _stack = [];

  void push(double value) {
    _stack.add(value);
  }

  void add() {
    if (_stack.length >= 2) {
      double operand2 = _stack.removeLast();
      double operand1 = _stack.removeLast();
      _stack.add(operand1 + operand2);
    }
  }

  void subtract() {
    if (_stack.length >= 2) {
      double operand2 = _stack.removeLast();
      double operand1 = _stack.removeLast();
      _stack.add(operand1 - operand2);
    }
  }

  void multiply() {
    if (_stack.length >= 2) {
      double operand2 = _stack.removeLast();
      double operand1 = _stack.removeLast();
      _stack.add(operand1 * operand2);
    }
  }

  void divide() {
    if (_stack.length >= 2) {
      double operand2 = _stack.removeLast();
      double operand1 = _stack.removeLast();
      if (operand2 != 0) {
        _stack.add(operand1 / operand2);
      }
    }
  }

  void clear() {
    _stack.clear();
  }

  List<double> get stack => _stack;
}