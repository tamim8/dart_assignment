import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 2,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.computer,
              color: AppColors.primary,
              size: 36,
            ),
          ),
          const Text(
            'Computer',
            style: TextStyle(
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
