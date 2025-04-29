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
        backgroundColor: Color(0xFFFEF9ED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEE0BA),
          iconTheme: IconThemeData(color: Color(0xFF202118)),
          toolbarHeight: 60,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          centerTitle: true,
          title: Text(
            'Armazem do Sítio',
            style: TextStyle(color: Color(0xFF202118), fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container que fica no topo do aplicativo
              Container(
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
                      style: TextStyle(color: Color(0xFF8C9C6B), fontSize: 24),
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
              ),

              const SizedBox(height: 30),

              // Container unicamente para o texto "Produtos"
              Container(
                width: double.infinity, // Ocupa toda largura
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Produtos',
                  style: TextStyle(fontSize: 24, color: Color(0xFF202118)),
                  textAlign: TextAlign.start, // Alinha à esquerda
                ),
              ),

              const SizedBox(height: 10),

              // Containers menores que se refere aos produtos
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
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
                            onPressed: () {
                              print('Botão 1 clicado');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6A7F4E),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              minimumSize: Size(60, 20),
                            ),
                            child: Text(
                              'Pedir no WhatsApp',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 120,
                      height: 220,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('Botão 2 clicado');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6A7F4E),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              minimumSize: Size(60, 20),
                            ),
                            child: Text(
                              'Pedir no WhatsApp',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      margin: EdgeInsets.only(right: 10),
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
                            onPressed: () {
                              print('Botão 3 clicado');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6A7F4E),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              minimumSize: Size(60, 20),
                            ),
                            child: Text(
                              'Pedir no WhatsApp',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
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
