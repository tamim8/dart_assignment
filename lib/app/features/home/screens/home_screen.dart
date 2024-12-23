import 'package:ecommerce_getx/app/features/common/widget/category_item_widget.dart';
import 'package:ecommerce_getx/app/features/common/widget/product_item_widget.dart';
import 'package:ecommerce_getx/app/features/common/widget/section_header_widget.dart';
import 'package:ecommerce_getx/app/features/home/screens/widgets/home_screen_slider.dart';
import 'package:ecommerce_getx/app/features/home/screens/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 16),
          ProductSearchBar(controller: _searchBarController),
          const SizedBox(height: 16),
          const HomeScreenSlider(),
          const SizedBox(height: 16),
          SectionHeader(title: 'Categories', onTap: () {}),
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
            child: Row(spacing: 16, children: _popularProductList()),
          ),
          SectionHeader(title: 'Special', onTap: () {}),
          SectionHeader(title: 'New', onTap: () {}),
        ],
      ),
    );
  }

  List<Widget> _categoryList() {
    final List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(const CategoryItemWidget());
    }
    return list;
  }
  List<Widget> _popularProductList() {
    final List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(const ProductItemWidget());
    }
    return list;
  }
}
