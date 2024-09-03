import 'package:flutter/material.dart';

import 'home_page.dart';

class CalculationHistory extends StatefulWidget {
  const CalculationHistory({super.key, required this.list});

  final List<Map<String, String>> list;

  @override
  State<CalculationHistory> createState() => _CalculationHistoryState();
}

class _CalculationHistoryState extends State<CalculationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
          itemCount: widget.list.length,
          padding: const EdgeInsets.all(16),
          reverse: false,
          itemBuilder: (context, index) {
            final calculation = widget.list[index];
            return ListTile(
              shape: const Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey)),
              title: Text(
                calculation['input'].toString(),
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 12),
              ),
              subtitle: Text(calculation['result'].toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              onTap: () {
                final input = calculation['input'].toString();
                final result = calculation['result'].toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(input: input, result: result),
                  ),
                );
              },
            );
          }),
    );
  }
}
