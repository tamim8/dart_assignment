import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CreateNewReviewSection extends StatefulWidget {
  const CreateNewReviewSection({super.key});

  @override
  State<CreateNewReviewSection> createState() => _CreateNewReviewSectionState();
}

class _CreateNewReviewSectionState extends State<CreateNewReviewSection> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.primary.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews (100)',
            style: textTheme.titleMedium,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            onPressed: () => showFullScreenDialog(context),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  showFullScreenDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Review'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 8,
              children: [
                const SizedBox(height: 48),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Submit')),
              ],
            ),
          ),
        );
      },
    );
  }
}
