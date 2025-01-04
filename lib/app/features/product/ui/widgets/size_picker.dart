import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.selectedSize});

  final List<String> sizes;

  final Function(String) selectedSize;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          Row(
            spacing: 8,
            children: buildSizeList,
          ),
        ],
      ),
    );
  }
  List<Widget> get buildSizeList {
    List<Widget> list = [];
    for (String size in widget.sizes) {
      final t = _buildSizeItem(
          size: size,
          onTap: () {
            _selectedSize = size;
            widget.selectedSize(size);
            setState(() {});
          },
          isSelected: _selectedSize == size);
      list.add(t);
    }
    return list;
  }

  Widget _buildSizeItem({required String size, required VoidCallback onTap, bool isSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey),
          color: isSelected ? AppColors.primary : null,
        ),
        child: FittedBox(
          child: Text(
            size,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : null,
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
