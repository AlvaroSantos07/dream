class Product {
  final String name;
  final num price;
  final String description;
  final String imagePath;
  double rating;
  int quantity;
  double totalPrice;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.rating = 0.0,
    this.quantity = 0,
    this.totalPrice = 0
  });

  void incrementQuantity() {
    quantity++;
    totalPrice += price;
  }

  void decrementQuantity() {
    quantity --;
    totalPrice -= quantity;
  }
}

