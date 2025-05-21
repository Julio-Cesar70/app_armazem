import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        backgroundColor: const Color(0xFFFEF9ED),
      ),
      backgroundColor: const Color(0xFFFEF9ED),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.grey[300], // Cor do cartão do produto
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                leading: Image.network(
                  product.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202118),
                  ),
                ),
                subtitle: Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8C9C6B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Botão de Remover com cor mais escura
                trailing: Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: IconButton(
                        icon: const Icon(Icons.delete,), // Ícone de remoção
                        color: Colors.black87, // Cor escura
                        onPressed: () {
                          cart.removeProduct(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${product.title} removido do carrinho!',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
