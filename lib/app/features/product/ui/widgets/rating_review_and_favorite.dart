import 'package:ecommerce_getx/app/routes/routes_name.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RatingReviewAndFavorite extends StatefulWidget {
  const RatingReviewAndFavorite({super.key});

  @override
  State<RatingReviewAndFavorite> createState() => _RatingReviewAndFavoriteState();
}

class _RatingReviewAndFavoriteState extends State<RatingReviewAndFavorite> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 2,
      children: [
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            Text('4.8'),
          ],
        ),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, RoutesName.productReview);
        }, child: const Text('Reviews')),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.primary),
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 16,
          ),
        ),
      ],
    );
  }
}
