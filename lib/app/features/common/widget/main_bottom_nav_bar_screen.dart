import 'package:ecommerce_getx/app/features/home/screens/home_screen.dart';
import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import 'app_bar_icon_button.dart';

class MainBottomNavBarScreen extends StatelessWidget {
  MainBottomNavBarScreen({super.key});

  final List<Widget> _screens = [
    const HomeScreen(),
    const Text('Category'),
    const Text('Home'),
    const Text('Home'),
  ];

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(ImagePath.logoNav),
        actions: [
          AppBarIconButton(
            icon: Icons.person_2_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AppBarIconButton(
            icon: Icons.phone,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
        leadingWidth: double.maxFinite,
      ),
      // appBar: const MyAppBar(),
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
