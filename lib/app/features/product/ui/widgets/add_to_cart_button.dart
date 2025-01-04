import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.primary.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Price:',
              style: textTheme.titleMedium,
            ),
            Text(
              '\$1,000',
              style: textTheme.titleMedium!.copyWith(color: AppColors.primary),
            ),
          ]),
          SizedBox(
            width: 128,
            child: ElevatedButton(onPressed: () {}, child: const Text("Add to cart")),
          )
        ],
      ),
    );
  }
}
