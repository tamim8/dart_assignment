import 'package:ecommerce_getx/app/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerce_getx/app/features/category/ui/screens/category_screen.dart';
import 'package:ecommerce_getx/app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_getx/app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_getx/app/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainBottomNavBarScreen extends StatelessWidget {
  MainBottomNavBarScreen({super.key});

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  final MainBottomNavController _controller = Get.put(MainBottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[_controller.selectedIndex.value]),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _controller.selectedIndex.value,
        onDestinationSelected: _controller.setIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined), // Different icon for clarity
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_travel_outlined),
            // Different icon for clarity
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard), // Different icon for clarity
            label: 'wish',
          ),
        ],
      );
    });
  }


}
