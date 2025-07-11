import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  String _operation = '+';
  String _result = '';

  void _calculate() {
    final a = double.tryParse(_aController.text) ?? 0;
    final b = double.tryParse(_bController.text) ?? 0;
    double value;
    switch (_operation) {
      case '+':
        value = a + b;
        break;
      case '-':
        value = a - b;
        break;
      case '×':
        value = a * b;
        break;
      case '÷':
        value = b != 0 ? a / b : double.nan;
        break;
      default:
        value = 0;
    }
    setState(() {
      _result = value.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'First number'),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Second number'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperationButton('+'),
                _buildOperationButton('-'),
                _buildOperationButton('×'),
                _buildOperationButton('÷'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(String op) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _operation = op;
        });
      },
      child: Text(op),
    );
  }
}
