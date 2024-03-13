class RPNCalculator {
  double _input1 = 0.0;
  double _input2 = 0.0;
  String _result = '';

  void setInput1(String value) {
    _input1 = double.tryParse(value) ?? 0.0;
  }

  void setInput2(String value) {
    _input2 = double.tryParse(value) ?? 0.0;
  }

  String calculate(String operator) {
    switch (operator) {
      case '+':
        _result = (_input1 + _input2).toString();
        break;
      case '-':
        _result = (_input1 - _input2).toString();
        break;
      case '*':
        _result = (_input1 * _input2).toString();
        break;
      case '/':
        if (_input2 != 0) {
          _result = (_input1 / _input2).toStringAsFixed(2);
        } else {
          _result = 'Error';
        }
        break;
      default:
        _result = 'Error';
    }
    return _result;
  }

  void clear() {
    _input1 = 0.0;
    _input2 = 0.0;
    _result = '';
  }

  String get result => _result;
}









