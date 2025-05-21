import 'package:flutter/material.dart';
 

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final List products = args?['products'] ?? [];
    final double frete = args?['frete'] ?? 5.0;
    final double total = args?['total'] ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
        backgroundColor: const Color(0xFFFEF9ED),
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFFEF9ED),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forma de Pagamento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            const Text('- Pix'),
            const Text('- Cartão de Crédito'),
            const Text('- Dinheiro na Entrega'),

            const SizedBox(height: 24),

            const Text(
              'Resumo do Pedido',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Lista os produtos com nome e preço
            Expanded(
              child: products.isEmpty
                  ? const Text('Nenhum produto selecionado.')
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '• ${product.productName} - ${product.productPrice}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
            ),

            Text('• Frete: R\$ ${frete.toStringAsFixed(2).replaceAll('.', ',')}'),
            Text('• Total: R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}'),

            const Spacer(),

            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Implementar confirmação do pedido aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8C9C6B),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Confirmar Pedido',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
