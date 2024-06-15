class FoodItem {
  final String name;
  final double price;
  int quantity;

  FoodItem(this.name, this.price, this.quantity);

  @override
  FoodItem copyWith({String? name, double? price, int? quantity}) {
    // Implement copy logic here
    return FoodItem(
      name ?? this.name,
      price ?? this.price,
      quantity ?? this.quantity,
    );
  }
}