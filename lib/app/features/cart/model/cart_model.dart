import 'cart_item_model.dart';

class CartModel {
  List<CartItemModel> cartItems = [];

  CartModel(this.cartItems);

  // Method to add a new item to the cart
  void addItem(CartItemModel item) => cartItems.add(item);

  // Method to remove an item from the cart
  void removeItem(CartItemModel item) => cartItems.remove(item);

  // Method to calculate the total price of all items in the cart
  int get totalAmount => cartItems.fold(0, (total, item) => total + item.getTotalPrice);

  // Method to update the quantity of a specific item in the cart
  void updateItemQuantity(CartItemModel item, int newQuantity) {
    final itemIndex = cartItems.indexOf(item);
    if (itemIndex != -1) {
      cartItems[itemIndex].updateQuantity(newQuantity);
    }
  }
}
