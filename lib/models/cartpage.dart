import 'package:flutter/material.dart';
import 'package:mvapp/models/cartitem.dart';
import 'package:mvapp/models/foodprovider.dart';
import 'package:mvapp/payment/payment.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return CartItemWidget(
                    item: item,
                    onRemove: () => cartProvider.removeFromCart(item),
                    onUpdate: (newQuantity) =>
                        cartProvider.updateQuantity(item, newQuantity));
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$ ${cartProvider.totalPrice.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
