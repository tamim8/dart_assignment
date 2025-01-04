import 'package:ecommerce_getx/app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_getx/app/features/common/widgets/category_item_widget.dart';
import 'package:ecommerce_getx/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
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
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              childAspectRatio: 0.9,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return FittedBox(
                child: CategoryItem(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.productList, arguments: 'Mobile');
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
