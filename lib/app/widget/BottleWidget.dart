import 'package:flutter/material.dart';

import 'BottlePainter.dart';

class BottleWidget extends StatelessWidget {
  final double fillPercentage;

  const BottleWidget({Key? key, required this.fillPercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 300),
      painter: BottlePainter(fillPercentage),
    );
  }
}
