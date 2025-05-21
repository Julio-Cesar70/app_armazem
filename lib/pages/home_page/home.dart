import 'package:armazen_do_sitio/services/product_service.dart';
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
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    futureProducts = ProductService.fetchProducts();
  }

  void _mudarPagina(int index) {
    setState(() {
      _paginaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: const Color(0xFFFED9ED),
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
                FutureBuilder<List<Product>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              snapshot.data!.map((product) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ProductItem(
                                    imagePath: product.image,
                                    productName: product.title,
                                    productPrice: product.price,
                                    onPressed2: () {
                                      Provider.of<CartProvider>(
                                        context,
                                        listen: false,
                                      ).addProduct(product);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Produto Adicionado ao carrinho!",
                                          ),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    description: product.description,
                                  ),
                                );
                              }).toList(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
