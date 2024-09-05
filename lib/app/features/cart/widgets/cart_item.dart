import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String color;
  final String size;
  final int price;
  final int quantity;
  final String image;
  final Function(int) onQuantityChanged;

  const CartItem({
    super.key,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.image,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(image, width: 80, height: 80),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(

                          onPressed: () {},
                          // Disable if quantity is 1
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text('Color: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                        Text(color, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        const SizedBox(width: 5),
                        const Text('Size: ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                        Text(size, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: quantity > 1
                                  ? () {
                                      onQuantityChanged(quantity - 1);
                                    }
                                  : null,
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                onQuantityChanged(quantity + 1);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        Text(
                          '${price * quantity}\$',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(width: 16),
              // Column(
              //   children: [
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
