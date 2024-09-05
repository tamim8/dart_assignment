import 'package:flutter/material.dart';

import '../model/cart_item_model.dart';
import '../model/cart_model.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartPage> {
  // Initialize cart with sample items
  CartModel cart = CartModel([
    CartItemModel(
      name: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
      image: 'assets/images/pullover.png',
    ),
    CartItemModel(
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      price: 30,
      quantity: 1,
      image: 'assets/images/tshirt.png',
    ),
    CartItemModel(
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
      image: 'assets/images/sportdress.png',
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                CartItemModel item = cart.cartItems[index];
                return CartItem(
                  name: item.name,
                  color: item.color,
                  size: item.size,
                  price: item.price,
                  quantity: item.quantity,
                  image: item.image,
                  // Callback to increase or decrease quantity
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cart.updateItemQuantity(item, newQuantity);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total amount:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${cart.totalAmount}\$',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Show snack bar with congratulatory message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Congratulations! Your order has been placed.')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('CHECK OUT', style: TextStyle(fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }
}
