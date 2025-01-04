import 'package:ecommerce_getx/app/features/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/routes_name.dart';
import '../../../../utils/constants/image_path.dart';
import '../../../common/controllers/main_bottom_nav_controller.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(ImagePath.logoNavSvg),
        actions: [
          AppBarIconButton(
            icon: Icons.person_2_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AppBarIconButton(
            icon: Icons.phone,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
        leadingWidth: double.maxFinite,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 16),
            ProductSearchBar(controller: _searchBarController),
            const SizedBox(height: 16),
            const HomeScreenSlider(),
            const SizedBox(height: 16),
            SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory;
                }),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(spacing: 16, children: _categoryList()),
            ),
            const SizedBox(height: 16),
            SectionHeader(title: 'Popular', onTap: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(spacing: 8, children: _popularProductList()),
            ),
            SectionHeader(title: 'Special', onTap: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(spacing: 8, children: _popularProductList()),
            ),
            SectionHeader(title: 'New', onTap: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(spacing: 8, children: _popularProductList()),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _categoryList() {
    final List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(CategoryItem(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.productList, arguments: 'Computer');
        },
      ));
    }
    return list;
  }

  List<Widget> _popularProductList() {
    final List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(const ProductItem());
    }
    return list;
  }
}
