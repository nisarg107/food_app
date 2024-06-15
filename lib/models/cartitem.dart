import 'package:flutter/material.dart';
import 'package:mvapp/models/fooditem.dart';

class CartItemWidget extends StatelessWidget {
  final FoodItem item;
  final VoidCallback onRemove;
  final ValueChanged<int> onUpdate;

  CartItemWidget(
      {required this.item, required this.onRemove, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(item.name),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () =>
                  onUpdate(item.quantity > 1 ? item.quantity - 1 : 1),
            ),
            Text('${item.quantity}'),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () => onUpdate(item.quantity + 1),
            ),
          ],
        ),
        Text('\$ ${(item.price * item.quantity).toStringAsFixed(2)}'),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ],
    );
  }
}
