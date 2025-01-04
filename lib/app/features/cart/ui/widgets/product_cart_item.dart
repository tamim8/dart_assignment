import 'package:ecommerce_getx/app/features/common/widgets/quantity_update_button.dart';
import 'package:ecommerce_getx/app/routes/routes_name.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.productDetails, arguments: 1);
      },
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 8),
              child: SizedBox(width: 100, child: Image.asset(ImagePath.shoePng)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'New Year Special Shoe 30',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: const Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      spacing: 8,
                      children: [
                        Text('Color: Red'),
                        Text('Size: XL'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$100',
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                        QuantityUpdateButton(
                          onChange: (int quantity) {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      width: 100,
      child: Image.asset(ImagePath.shoePng),
    );
  }
}
