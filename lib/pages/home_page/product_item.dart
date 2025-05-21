import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String description;
  final String productPrice;

  final VoidCallback onPressed2;

  const ProductItem({
    required this.imagePath,
    required this.productName,
    required this.description,
    required this.productPrice,
    required this.onPressed2,
    super.key,
  });

void _showProductDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(productName),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(imagePath, height: 150),
              const SizedBox(height: 10),
              Text(description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                productPrice,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4A5D23),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagem arredondada do Produto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Borda arredondada
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) { 
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, size: 50),
                    );
                  },
                ),
              ),
            ),
          ),
          // Nome do produto (por exemplo, "Pão Caseiro")
          Text(
            productName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Preço do produto com cor ajustada para o tema do app
          Text(
            productPrice,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF4A5D23), // Verde escuro, combinando com o tema
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8), // Espaçamento entre o preço e os botões
          // Preenche o espaço para empurrar os botões para baixo
          const Spacer(),
          // Botões (colados e na parte inferior)
          Column(
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () => _showProductDetails(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8C9C6B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    minimumSize: const Size(120, 35),
                  ),
                  child: const Text('Mais Detalhes', style: TextStyle(fontSize: 12)),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: onPressed2,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8C9C6B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: const Size(120, 35),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Adicionar ao Carrinho',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
