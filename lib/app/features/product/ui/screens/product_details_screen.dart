import 'package:ecommerce_getx/app/features/common/widgets/quantity_update_button.dart';
import 'package:ecommerce_getx/app/features/product/ui/widgets/add_to_cart_button.dart';
import 'package:ecommerce_getx/app/features/product/ui/widgets/color_picker.dart';
import 'package:ecommerce_getx/app/features/product/ui/widgets/product_image_slider.dart';
import 'package:ecommerce_getx/app/features/product/ui/widgets/rating_review_and_favorite.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: AppColors.greyLight,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 8,
                children: [
                  const ProductImageSlider(),
                  _buildProductSummary(textTheme),
                  ColorPicker(
                    colors: const [Colors.white, Colors.green, Colors.red, Colors.blue],
                    selectedColor: (Color selectedColor) {},
                  ),
                   SizePicker(
                    sizes: const ["S", "M", "L","XL"],
                    selectedSize: (String selectedSize) {},
                  ),
                  _buildProductDescription(textTheme),
                ],
              ),
            ),
          ),
          const AddToCartButton(),
        ],
      ),
    );
  }

  Widget _buildProductSummary(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Happy New Year Special Deal Save 30%', style: textTheme.bodyLarge),
              ),
              QuantityUpdateButton(
                onChange: (int quantity) {},
              ),
            ],
          ),
          const RatingReviewAndFavorite(),
        ],
      ),
    );
  }

  Widget _buildProductDescription(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            child: Text(
              'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
