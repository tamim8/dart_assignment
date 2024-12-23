import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:ecommerce_getx/app/utils/constants/app_sizes.dart';
import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class HomeScreenSlider extends StatefulWidget {
  const HomeScreenSlider({super.key});

  @override
  State<HomeScreenSlider> createState() => _HomeScreenSliderState();
}

class _HomeScreenSliderState extends State<HomeScreenSlider> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 8,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
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
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.m), // Match the border radius of the TextFormField
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(ImagePath.shoe, width: 144),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Happy New Year\nSpecial Deal\nSave 30%',
                            style: textTheme.titleMedium!.copyWith(color: Colors.white),
                          ),
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(backgroundColor: Colors.white, fixedSize: const Size(100, 20)),
                            onPressed: () {},
                            child: Text(
                              'Buy Now',
                              style: textTheme.labelMedium!.copyWith(color: AppColors.primary),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
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
                        color: i == value ? AppColors.primary : Colors.transparent),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
