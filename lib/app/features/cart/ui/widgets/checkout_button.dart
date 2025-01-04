import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({super.key});

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Container(
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
              'Total Price:',
              style: textTheme.titleMedium,
            ),
            Text(
              '\$100,000.00',
              style: textTheme.titleMedium!.copyWith(color: AppColors.primary),
            ),
          ]),
          SizedBox(
            width: 128,
            child: ElevatedButton(onPressed: () {}, child: const Text("Checkout")),
          )
        ],
      ),
    );
  }
}
