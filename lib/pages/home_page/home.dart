import 'package:app_armazem/pages/home_page/app_bar.dart';
import 'package:app_armazem/pages/home_page/header_container.dart';
import 'package:app_armazem/pages/home_page/product_item.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar
        appBar: buildCustomAppBar(),
        backgroundColor: Color(0xFFFEF9ED),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container que fica no topo do aplicativo
              HeaderContainer(),

              const SizedBox(height: 30),

              // Container unicamente para o texto "Produtos"
              Container(
                width: double.infinity, // Ocupa toda largura
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Principais Produtos',
                  style: TextStyle(fontSize: 24, color: Color(0xFF202118)),
                  textAlign: TextAlign.start, // Alinha à esquerda
                ),
              ),

              const SizedBox(height: 10),

              // Containers menores que se refere aos produtos
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductItem(
                      imagePath: 'assets/images/imagem_RoscaCaseira.png',
                      productName: 'Rosca Caseira',
                      productPrice: 'R\$ 5,00',
                      onPressed1: () => print('Mais Detalhes 1'),
                      onPressed2: () => print('Pedir do WhatsApp 1'),
                    ),

                    const SizedBox(width: 10),

                    ProductItem(
                      imagePath: 'assets/images/imagem_PaoCaseiro.png',
                      productName: 'Pão Caseiro',
                      productPrice: 'R\$ 5,00',
                      onPressed1: () => print('Mais Detalhes 1'),
                      onPressed2: () => print('Pedir do WhatsApp 1'),
                    ),

                    const SizedBox(width: 10,),

                    ProductItem(
                      imagePath: 'assets/images/imagem_Alface.jpg',
                      productName: 'Alface',
                      productPrice: 'R\$ 5,00',
                      onPressed1: () => print('Mais Detalhes 1'),
                      onPressed2: () => print('Pedir do WhatsApp 1'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
