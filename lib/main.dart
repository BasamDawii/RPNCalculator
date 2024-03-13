import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPN Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RPNCalculatorScreen(),
    );
  }
}

class RPNCalculator {
  double _input1 = 0;
  double _input2 = 0;
  double _result = 0;

  void setInput1(double value) {
    _input1 = value;
  }

  void setInput2(double value) {
    _input2 = value;
  }

  void add() {
    _result = _input1 + _input2;
  }

  void subtract() {
    _result = _input1 - _input2;
  }

  void multiply() {
    _result = _input1 * _input2;
  }

  void divide() {
    if (_input2 != 0) {
      _result = _input1 / _input2;
    } else {
      _result = double.infinity;
    }
  }

  void clear() {
    _input1 = 0;
    _input2 = 0;
    _result = 0;
  }

  double get result => _result;
}

class RPNCalculatorScreen extends StatefulWidget {
  @override
  _RPNCalculatorScreenState createState() => _RPNCalculatorScreenState();
}

class _RPNCalculatorScreenState extends State<RPNCalculatorScreen> {
  final RPNCalculator calculator = RPNCalculator();
  TextEditingController inputController1 = TextEditingController();
  TextEditingController inputController2 = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void _updateDisplay() {
    resultController.text = calculator.result.toString();
  }

  void _performOperation(void Function() operation) {
    calculator.setInput1(double.tryParse(inputController1.text) ?? 0);
    calculator.setInput2(double.tryParse(inputController2.text) ?? 0);
    operation();
    _updateDisplay();
    setState(() {});
  }

  void _clearAll() {
    inputController1.clear();
    inputController2.clear();
    resultController.clear();
    calculator.clear();
    setState(() {});
  }

  void _handleEnter() {
    if (resultController.text.isNotEmpty) {
      inputController1.text = resultController.text;
      inputController2.clear();
      resultController.clear();
      calculator.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double buttonWidth = size.width / 4;
    final double buttonHeight = size.height / 10;

    return Scaffold(
      appBar: AppBar(
        title: Text('RPN Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: inputController1,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Input 1:',
                  ),
                  textAlign: TextAlign.right,
                ),
                TextField(
                  controller: inputController2,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Input 2:',
                  ),
                  textAlign: TextAlign.right,
                ),
                TextField(
                  controller: resultController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Result:',
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: buttonWidth / buttonHeight,
            children: <Widget>[
              ...List.generate(10, (index) {
                // Generate number buttons
                return CalculatorButton(
                  label: '${index}',
                  onTap: () {
                    if (inputController1.text.isEmpty || inputController2.text.isNotEmpty) {
                      inputController1.text += '${index}';
                    } else {
                      inputController2.text += '${index}';
                    }
                    setState(() {});
                  },
                  buttonWidth: buttonWidth,
                  buttonHeight: buttonHeight,
                );
              }),
              CalculatorButton(
                label: '.',
                onTap: () {
                  if (inputController1.text.isEmpty || inputController2.text.isNotEmpty) {
                    inputController1.text += '.';
                  } else {
                    inputController2.text += '.';
                  }
                  setState(() {});
                },
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: 'Enter',
                onTap: _handleEnter,
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: '+',
                onTap: () => _performOperation(calculator.add),
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: '-',
                onTap: () => _performOperation(calculator.subtract),
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: '*',
                onTap: () => _performOperation(calculator.multiply),
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: '/',
                onTap: () => _performOperation(calculator.divide),
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
              CalculatorButton(
                label: 'Clear',
                onTap: _clearAll,
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double buttonWidth;
  final double buttonHeight;

  const CalculatorButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
