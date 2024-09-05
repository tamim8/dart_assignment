class CartItemModel {
  String name;
  String color;
  String size;
  int price;
  int quantity;
  String image;

  CartItemModel({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.image,
  });

  // Method to update the quantity of an item
  void updateQuantity(int newQuantity) => quantity = newQuantity;

  // Method to calculate total price for a specific item
  int get getTotalPrice => price * quantity;
}