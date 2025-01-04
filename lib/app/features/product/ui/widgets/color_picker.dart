import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.selectedColor, required this.colors});

  final List<Color> colors ;
  final Function(Color) selectedColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          Row(
            spacing: 8,
            children: buildColorList,
          ),
        ],
      ),
    );
  }

  List<Widget> get buildColorList {
    List<Widget> list = [];
    for (Color c in widget.colors) {
      final t = _buildColorItem(
          color: c,
          onTap: () {
            _selectedColor = c;
            widget.selectedColor(c);
            setState(() {});
          },
          isSelected: _selectedColor == c);
      list.add(t);
    }
    return list;
  }

  Widget _buildColorItem({Color? color, required VoidCallback onTap, required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          color: color,
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                color: color == Colors.white ? Colors.black : Colors.white,
                size: 18,
              )
            : null,
      ),
    );
  }
}
