import 'package:flutter/material.dart';
import 'package:mvapp/models/fooditem.dart';

class CartProvider extends ChangeNotifier {
  int maxQuantity = 100;
  List<FoodItem> _cartItems = [];

  List<FoodItem> get cartItems => List.unmodifiable(_cartItems);

  double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  void addToCart(FoodItem item) {
    _cartItems.add(item.copyWith(quantity: 1)); // Add new item with quantity 1
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void updateQuantity(FoodItem item, int newQuantity) {
    final existingItem =
        _cartItems.firstWhere((element) => element.name == item.name);
    if (existingItem != null) {
      existingItem.quantity = newQuantity.clamp(1, maxQuantity);
    }
    notifyListeners();
  }
}
