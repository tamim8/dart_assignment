import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityUpdateButton extends StatefulWidget {
  const QuantityUpdateButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<QuantityUpdateButton> createState() => _QuantityUpdateButtonState();
}

class _QuantityUpdateButtonState extends State<QuantityUpdateButton> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        _buildCustomButton(
            icon: Icons.add,
            onTap: () {
              quantity < 20 ? widget.onChange(quantity++) : null;
              setState(() {});
            }),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            quantity.toString(),
            style: textTheme.titleMedium,
          ),
        ),
        _buildCustomButton(
            icon: Icons.remove,
            onTap: () {
              quantity > 1 ? widget.onChange(quantity--) : null;
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildCustomButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.primary),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
