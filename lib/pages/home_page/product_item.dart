import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final String description;
  final VoidCallback onPressed2; // Adicionar ao Carrinho

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.description,
    required this.onPressed2,
  });

  void _showProductDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(productName),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(imagePath, height: 150),
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
        color: const Color(0xFFF7F6F2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 160,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            productName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            productPrice,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF4A5D23),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
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
              const SizedBox(height: 5),
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
