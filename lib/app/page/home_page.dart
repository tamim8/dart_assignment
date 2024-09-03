import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.input,
    this.result,
  });

  final String? input;
  final String? result;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _resultFontSize = 24.0;
  FontWeight _resultFontWeight = FontWeight.normal;
  double _outputFontSize = 40.0;
  FontWeight _outputFontWeight = FontWeight.bold;

  String _result = "0";
  String _output = "";
  String _input = "0";

  List<Map<String, String>> history = [];

  _doCalculation({required String value}) {
    //
    if (value == 'c') {
      _input = '0';
    }
    if (value == "⌫") {
      if (_input.length > 1) {
        _input = _input.substring(0, _input.length - 1);
      } else {
        _input = '0';
      }
    }
    if (value == '.') {
      final lastChar = _input.isEmpty ? '' : _input[_input.length - 1];

      if (lastChar != '.' &&
          !_input.split(RegExp(r'[+\-*/%]')).last.contains('.')) {
        _input += value;
      }
    }

    const String numberAndOperator = '0123456789+-*/%';
    if (numberAndOperator.contains(value)) {
      if (_input == '0' && value == '0') return;
      if (_input == '0') {
        _input = value;
      } else if (isOperator(_input.substring(_input.length - 1)) &&
          isOperator(value)) {
        _input = _input.replaceAll(_input.substring(_input.length - 1), value);
      } else {
        _input = _input + value;
      }
    }
    _output = _input;
    _result = evaluate(_input);

    if (value == '=') {
      _viewResult(true);
    } else {
      _viewResult(false);
    }
    setState(() {});
  }

  void _viewResult(isView) {
    if (isView) {
      history.add({'input': _input, 'result': _result});
      _input = '0';
      _resultFontSize = 40.0;
      _resultFontWeight = FontWeight.bold;
      _outputFontSize = 24.0;
      _outputFontWeight = FontWeight.normal;
    } else {
      _resultFontSize = 24.0;
      _resultFontWeight = FontWeight.normal;
      _outputFontSize = 40.0;
      _outputFontWeight = FontWeight.bold;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _input = widget.input ?? "0";
    _output = widget.input ?? "0";
    _result = widget.result ?? "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculator'),
        automaticallyImplyLeading: false, // This hides the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: size.height / 2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(Icons.close),
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'History',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                AspectRatio(

                                  aspectRatio: 16/9,
                                  child: ListView.separated(
                                    itemCount: history.length,
                                    padding: const EdgeInsets.all(16),
                                    reverse: false,
                                    itemBuilder: (context, index) {
                                      final calculation = history[index];
                                      return ListTile(
                                        title: Text(
                                          calculation['input'].toString(),
                                          textAlign: TextAlign.end,
                                          style:
                                          const TextStyle(fontSize: 12),
                                        ),
                                        subtitle: Text(
                                            calculation['result']
                                                .toString(),
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w600)),
                                        onTap: () {
                                          final input = calculation['input']
                                              .toString();
                                          final result =
                                          calculation['result']
                                              .toString();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => HomePage(
                                                  input: input,
                                                  result: result),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                        const Divider(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => CalculationHistory(list: _history),
                  //   ),
                  // );
                },
                child: const Text('History'),
              ),
            ),
            Column(
              children: [
                _buildResult(
                    result: _output,
                    fontSize: _outputFontSize,
                    fontWeight: _outputFontWeight),
                _buildResult(
                    result: _result,
                    fontSize: _resultFontSize,
                    fontWeight: _resultFontWeight),
                const Divider(),
                Row(
                  children: [
                    _buildButton(
                        label: 'C',
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: 'c')),
                    _buildButton(
                        icon: Icons.backspace_outlined,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '⌫')),
                    _buildButton(
                        icon: Icons.percent,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '%')),
                    _buildButton(
                        icon: CupertinoIcons.divide,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '/')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildButton(
                        label: '7', onTap: () => _doCalculation(value: '7')),
                    _buildButton(
                        label: '8', onTap: () => _doCalculation(value: '8')),
                    _buildButton(
                        label: '9', onTap: () => _doCalculation(value: '9')),
                    _buildButton(
                        icon: Icons.close,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '*')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildButton(
                        label: '4', onTap: () => _doCalculation(value: '4')),
                    _buildButton(
                        label: '5', onTap: () => _doCalculation(value: '5')),
                    _buildButton(
                        label: '6', onTap: () => _doCalculation(value: '6')),
                    _buildButton(
                        icon: Icons.remove,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '-')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildButton(
                        label: '1', onTap: () => _doCalculation(value: '1')),
                    _buildButton(
                        label: '2', onTap: () => _doCalculation(value: '2')),
                    _buildButton(
                        label: '3', onTap: () => _doCalculation(value: '3')),
                    _buildButton(
                        icon: Icons.add,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '+')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildButton(
                        label: '0',
                        flex: 2,
                        onTap: () => _doCalculation(value: '0')),
                    _buildButton(
                        label: '.', onTap: () => _doCalculation(value: '.')),
                    _buildButton(
                        icon: CupertinoIcons.equal,
                        color: Colors.blue,
                        onTap: () => _doCalculation(value: '=')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(
      {required String result, required double fontSize, required fontWeight}) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        result,
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  ///-- Calculator Buttons --
  Widget _buildButton(
      {String? label,
      IconData? icon,
      Color color = Colors.white,
      flex = 1,
      required onTap}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: icon != null
                ? Icon(
                    icon,
                    color: color,
                  )
                : Text(
                    label!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

String evaluate(String expression) {
  List<String> tokens = expression.split(RegExp(r'(?=[+\-*/%])|(?<=[+\-*/%])'));
  double result = parseTokens(tokens);
  // Check if the result is an integer
  if (result % 1 == 0) {
    // Return as an integer if there's no fractional part
    if (result != 0) return '= ${result.toInt().toString()}';
    return "0"; // Return 0 if the result is 0
  }
  return '= ${result.toInt().toString()}';
}

double parseTokens(List<String> tokens) {
  double total = 0.0;
  String operator = '+';

  for (String token in tokens) {
    if (token == '.') {
    } else if (isOperator(token)) {
      operator = token;
    } else {
      double value = double.parse(token);
      switch (operator) {
        case '+':
          total += value;
          break;
        case '-':
          total -= value;
          break;
        case '*':
          total *= value;
          break;
        case '/':
          total /= value;
        case '%':
          total %= value;
          break;
      }
    }
  }

  return total;
}

bool isOperator(String token) {
  return token == '+' ||
      token == '-' ||
      token == '*' ||
      token == '/' ||
      token == '%';
}
