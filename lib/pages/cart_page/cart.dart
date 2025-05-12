import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().products;

    return Scaffold(
      backgroundColor: Color(0xFFFEF9ED),
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        backgroundColor: const Color(0xFFFEF9ED),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.asset(product.imagePath, width: 50),
            title: Text(product.productName),
            subtitle: Text(product.productPrice),
          );
        },
      ),
    );
  }
}
