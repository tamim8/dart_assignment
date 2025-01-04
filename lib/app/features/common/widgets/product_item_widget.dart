import 'package:ecommerce_getx/app/routes/routes_name.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.productDetails, arguments: 1);
      },
      child: SizedBox(
        width: 128,
        child: Card(
          color: Colors.white,
          child: Column(
            spacing: 2,
            children: [
              _buildProductImage(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'New Year Special Shoe 30',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$100',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
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
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.primary),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          color: AppColors.primary.withValues(alpha: 0.1)),
      child: Image.asset(ImagePath.shoePng),
    );
  }
}
