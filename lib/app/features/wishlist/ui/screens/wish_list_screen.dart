
import 'package:ecommerce_getx/app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_getx/app/features/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome;
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
              crossAxisSpacing: 8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductItem());
            },
          ),
        ),
      ),
    );
  }
}
