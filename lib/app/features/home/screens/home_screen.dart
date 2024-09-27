import 'package:flutter/material.dart';
import 'package:task_manager/app/common/widget/app_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
