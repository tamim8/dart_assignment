import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, _) {
              _notifier.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(color: AppColors.greyLight
                      // Match the border radius of the TextFormField
                      ),
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(ImagePath.shoePng, width: 200)),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: ValueListenableBuilder(
            valueListenable: _notifier,
            builder: (context, value, widget) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                          color: i == value
                              ? AppColors.primary
                              : Colors.transparent),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
