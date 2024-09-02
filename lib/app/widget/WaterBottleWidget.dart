import 'package:flutter/material.dart';

import '../utils/constance/image_path.dart';

class WaterBottleWidget extends StatelessWidget {
  const WaterBottleWidget({
    super.key,
    required this.fillPercentage,
    required this.goal,
  });

  final int goal;
  final double fillPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Water fill level
            Positioned(
              bottom: 36,
              left: 43,
              child: Container(
                width: 98,
                height: 180 * fillPercentage / 100, // Adjust height based on fillPercentage
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
              ),
            ),

            // Bottle Image
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Image.asset(
                ImagePath.waterBottle, // Use your bottle image here
                width: 130,
                height: 350,
              ),
            ),

            // Water Liter level
            Positioned(
              left: 0,
              top: 125,
              bottom: 30,
              child: SizedBox(
                height: 150,
                width: 50,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double availableHeight = constraints.maxHeight;
                    double itemHeight = 20; // Approximate height of each item (you can adjust this)
                    int itemCount = goal > 8 ? 8 : goal;
                    double totalItemsHeight = itemHeight * itemCount;

                    // Calculate dynamic padding
                    double padding = (availableHeight - totalItemsHeight) / (itemCount + 1);

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        int reversedIndex = itemCount - index;
                        return Padding(
                          padding: EdgeInsets.only(bottom: padding), // Dynamic padding
                          child: Text('$reversedIndex L  -'),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
