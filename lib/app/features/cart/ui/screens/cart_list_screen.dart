import 'package:ecommerce_getx/app/features/cart/ui/widgets/checkout_button.dart';
import 'package:ecommerce_getx/app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_cart_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart List'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome;
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return const ProductCartItem();
                  },
                ),
              ),
            ),
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }
}
