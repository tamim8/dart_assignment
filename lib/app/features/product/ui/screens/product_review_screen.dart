import 'package:flutter/material.dart';

import '../widgets/create_new_review_section.dart';
import '../widgets/review_item_widget.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ReviewItem();
                },
              ),
            ),
          ),
          const CreateNewReviewSection(),
        ],
      ),
    );
  }
}
