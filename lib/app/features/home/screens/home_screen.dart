import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/app_background.dart';
import '../../../common/widget/my_app_bar.dart';
import '../controllers/home_controller.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _screens = [
    NewTaskView(),
    const ProgressTaskView(),
    const CompletedTaskView(),
    const CanceledTaskView(),
  ];

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: AppBackground(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() => _screens[_controller.selectedIndex.value]),
      ),
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
            icon: Icon(Icons.task_outlined),
            label: 'New Task',
          ),
          NavigationDestination(
            icon: Icon(Icons.hourglass_empty), // Different icon for clarity
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            // Different icon for clarity
            label: 'Completed',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined), // Different icon for clarity
            label: 'Canceled',
          ),
        ],
      );
    });
  }
}
