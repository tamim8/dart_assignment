import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 16,
                  child: const Icon(
                    Icons.person,
                    size: 18,
                  ),
                ),
                Text(
                  'Tamim Hasan',
                  style: textTheme.titleMedium,
                )
              ],
            ),
            Text(
              'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator',
              style: textTheme.bodySmall!.copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
