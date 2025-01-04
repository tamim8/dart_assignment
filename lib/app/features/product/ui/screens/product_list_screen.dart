import 'package:ecommerce_getx/app/features/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductItem());
          },
        ),
      ),
    );
  }
}
