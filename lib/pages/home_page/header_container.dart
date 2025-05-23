import 'package:flutter/material.dart';

class HeaderContainer extends StatefulWidget {
  final VoidCallback onRefresh; // Função de callback para atualização
  
  const HeaderContainer({super.key, required this.onRefresh});

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  bool _isLoading = false;

  Future<void> _refreshProducts() async {
    setState(() {
      _isLoading = true;
    });
    
    // Espera 5 segundos e chama a função de atualização
    await Future.delayed(const Duration(seconds: 5));
    widget.onRefresh(); // Chama a função passada como parâmetro
    
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 200,
      alignment: const Alignment(0, -0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Armazem do Sítio',
            style: TextStyle(color: Color(0xFF8C9C6B), fontSize: 30),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLoading ? null : _refreshProducts,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8C9C6B),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 15,
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text(
                    'Atualizar',
                    style: TextStyle(fontSize: 18, fontFamily: 'Arial'),
                  ),
          ),
        ],  
      ),
    );
  }
}