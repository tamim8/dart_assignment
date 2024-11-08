import 'package:flutter/material.dart';

import '../../../common/widget/my_app_bar.dart';
import '../../../utils/helper/app_export.dart';
import 'canceled_task_view.dart';
import 'completed_task_view.dart';
import 'new_task_view.dart';
import 'progress_task_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const NewTaskView(),
    const CompletedTaskView(),
    const CanceledTaskView(),
    const ProgressTaskView(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar:  MyAppBar(context: context,),
        body: _screens[_selectedIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.task_outlined), label: 'New Task'),
        NavigationDestination(icon: Icon(Icons.task_outlined), label: 'Completed'),
        NavigationDestination(icon: Icon(Icons.task_outlined), label: 'Canceled'),
        NavigationDestination(icon: Icon(Icons.task_outlined), label: 'Progress'),
      ],
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
