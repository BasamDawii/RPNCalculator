import 'package:flutter/material.dart';
import 'logic.calculator.dart';

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

class RPNCalculatorScreen extends StatefulWidget {
  @override
  _RPNCalculatorScreenState createState() => _RPNCalculatorScreenState();
}

class _RPNCalculatorScreenState extends State<RPNCalculatorScreen> {
  final RPNCalculator calculator = RPNCalculator();
  TextEditingController inputController = TextEditingController();

  void _updateDisplay() {
    setState(() {});
  }

  void _pushValue(double value) {
    calculator.push(value);
    _updateDisplay();
  }

  void _performOperation(Function operation) {
    operation();
    _updateDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPN Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: calculator.stack.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${calculator.stack[index]}',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter Value',
            ),
            onSubmitted: (value) {
              _pushValue(double.tryParse(value) ?? 0);
              inputController.clear();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _performOperation(calculator.add),
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _performOperation(calculator.subtract),
                child: Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _performOperation(calculator.multiply),
                child: Text('×'),
              ),
              ElevatedButton(
                onPressed: () => _performOperation(calculator.divide),
                child: Text('÷'),
              ),
              ElevatedButton(
                onPressed:()=> _performOperation(calculator.clear),
                child: Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}