import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // List of items for the dropdown
  final List<String> _items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];

  // Default selected item
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: Text('Select a fruit'),
          value: _selectedItem, // currently selected item
          items: _items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
        ),
      ),
    );
  }
}