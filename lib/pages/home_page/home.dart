import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/product.dart';
import 'app_bar.dart';
import 'header_container.dart';
import 'product_item.dart';
import '../cart_page/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaAtual = 0;

  void _mudarPagina(int index) {
    setState(() {
      _paginaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: const Color(0xFFFEF9ED),
      body: IndexedStack(
        index: _paginaAtual,
        children: [
          // Página Inicial
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderContainer(),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Principais Produtos',
                    style: TextStyle(fontSize: 24, color: Color(0xFF202118)),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductItem(
                        imagePath: 'assets/images/imagem_RoscaCaseira.png',
                        productName: 'Rosca Caseira',
                        productPrice: 'R\$ 5,00',
                        onPressed1: () => print('Mais Detalhes 1'),
                        onPressed2: () {
                          final product = Product(
                            imagePath: 'assets/images/imagem_RoscaCaseira.png',
                            productName: 'Rosca Caseira',
                            productPrice: 'R\$ 5,00',
                          );
                          Provider.of<CartProvider>(context, listen: false).addProduct(product);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Produto adicionado ao carrinho!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      ProductItem(
                        imagePath: 'assets/images/imagem_PaoCaseiro.png',
                        productName: 'Pão Caseiro',
                        productPrice: 'R\$ 5,00',
                        onPressed1: () => print('Mais Detalhes 2'),
                        onPressed2: () {
                          final product = Product(
                            imagePath: 'assets/images/imagem_PaoCaseiro.png',
                            productName: 'Pão Caseiro',
                            productPrice: 'R\$ 5,00',
                          );
                          Provider.of<CartProvider>(context, listen: false).addProduct(product);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Produto adicionado ao carrinho!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      ProductItem(
                        imagePath: 'assets/images/imagem_Alface.jpg',
                        productName: 'Alface',
                        productPrice: 'R\$ 2,50',
                        onPressed1: () => print('Mais Detalhes 3'),
                        onPressed2: () {
                          final product = Product(
                            imagePath: 'assets/images/imagem_Alface.jpg',
                            productName: 'Alface',
                            productPrice: 'R\$ 2,50',
                          );
                          Provider.of<CartProvider>(context, listen: false).addProduct(product);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Produto adicionado ao carrinho!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Página do Carrinho
          const CartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        onTap: _mudarPagina,
        backgroundColor: const Color(0xFFFEF9ED),
        selectedItemColor: const Color(0xFF8C9C6B),
        unselectedItemColor: const Color(0xFF202118),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
