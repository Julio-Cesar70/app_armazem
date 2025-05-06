import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ProductItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 120,
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8C9C6B),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              minimumSize: const Size(60, 20),
              foregroundColor: Colors.white,
            ),
            child: Text(
              title,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
