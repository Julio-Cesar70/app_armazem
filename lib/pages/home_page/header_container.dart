import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 200,
      alignment: const Alignment(0, -0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Armazem do Sítio',
            style: TextStyle(color: Color(0xFF8C9C6B), fontSize: 30),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print('Botão clicado');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8C9C6B),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 5,
              ),
            ),
            child: Text(
              'Ver Produtos',
              style: TextStyle(fontSize: 18, fontFamily: 'Arial'),
            ),
          ),
        ],  
      ),
    );
  }
}



