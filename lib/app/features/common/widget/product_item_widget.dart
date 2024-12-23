import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 140,
      child: Column(
        children: [
          SvgPicture.asset(ImagePath.shoe)
        ],
      ),
    );
  }
}
